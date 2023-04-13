#include "llvm/IR/Function.h"
#include "llvm/Pass.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Transforms/Utils.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Transforms/Utils/Local.h"
#include "SplitBasicBlock.h"
#include "Utils.h"
#include <vector>
#include <cstdlib>
#include <ctime>
using namespace llvm;
using std::vector;

namespace
{
    class Flattening : public FunctionPass
    {
    public:
        static char ID;
        Flattening() : FunctionPass(ID)
        {
            srand(time(0));
        }

        // 对函数 F 进行平坦化
        void flatten(Function &F);

        bool runOnFunction(Function &F);
    };
}

bool Flattening::runOnFunction(Function &F)
{
    INIT_CONTEXT(F);
    // FunctionPass *pass = createSplitBasicBlockPass();
    // pass->runOnFunction(F);
    flatten(F);
    return true;
}

void Flattening::flatten(Function &F)
{
    // 第一步保存除入口(第一个基本块)之外的所有基本块保存到vector容器中
    vector<BasicBlock *> origBB;
    for (BasicBlock &BB : F) // 遍历函数F中的所有基本块
    {
        origBB.push_back(&BB); // 将基本块保存到vector容器中
    }
    origBB.erase(origBB.begin());                                       // 从vector容器中删除入口块
    BasicBlock &entryBB = F.getEntryBlock();                            // 获取入口块
    if (BranchInst *br = dyn_cast<BranchInst>(entryBB.getTerminator())) // 判断入口块的跳转指令是否是分支指令
    {
        if (br->isConditional())
        {
            // 如果入口块是条件分支，则将条件分支转换为无条件分支
            origBB.insert(origBB.begin(), entryBB.splitBasicBlock(br));
        }
    }
    // 第二步，创建分发块和返回块
    BasicBlock *dispatchBB = BasicBlock::Create(*CONTEXT, "dispatchBB", &F, &entryBB); // 创建分发块
    BasicBlock *returnBB = BasicBlock::Create(*CONTEXT, "returnBB", &F, &entryBB);     // 创建返回块
    entryBB.moveBefore(dispatchBB);                                                    // 将入口块移动到分发块之前
    entryBB.getTerminator()->eraseFromParent();                                        // 删除入口块的跳转指令
    BranchInst::Create(dispatchBB, &entryBB);                                          // 在入口块中添加跳转指令，跳转到分发块
    BranchInst::Create(dispatchBB, returnBB);                                          // 在返回块中添加跳转指令，跳转到分发块
    // 第三步，实现分发块的调度功能
    int randNumCase = rand();                                                                 // 生成随机数
    AllocaInst *swVarPtr = new AllocaInst(TYPE_I32, 0, "swVar.ptr", entryBB.getTerminator()); // 在入口块中创建一个局部变量
    new StoreInst(CONST_I32(randNumCase), swVarPtr, entryBB.getTerminator());                 // 将随机数保存到局部变量中
    LoadInst *swVar = new LoadInst(TYPE_I32, swVarPtr, "swVar", dispatchBB);                  // 在分发块中加载局部变量的值
    BasicBlock *defaultBB = BasicBlock::Create(*CONTEXT, "defaultBB", &F, returnBB);          // 创建默认块
    BranchInst::Create(returnBB, defaultBB);                                                  // 在默认块中添加跳转指令，跳转到返回块
    SwitchInst *swInst = SwitchInst::Create(swVar, defaultBB, 0, dispatchBB);                 // 在分发块中创建switch指令
    for (BasicBlock *BB : origBB)                                                             // 遍历除入口块之外的所有基本块
    {
        BB->moveBefore(returnBB);                    // 将基本块移动到返回块之前
        swInst->addCase(CONST_I32(randNumCase), BB); // 将基本块添加到switch指令中
        randNumCase = rand();                        // 生成随机数
    }
    // 第四步，实现调度变量自动调整
    for (BasicBlock *BB : origBB) // 遍历除入口块之外的所有基本块
    {
        if (BB->getTerminator()->getNumSuccessors() == 0) // 如果基本块没有后继基本块，则跳过
        {
            continue;
        }
        else if (BB->getTerminator()->getNumSuccessors() == 1) // 如果基本块只有一个后继基本块，则将调度变量的值设置为随机数
        {
            // 获取switch指令中的case值
            ConstantInt *numCase = swInst->findCaseDest(BB->getTerminator()->getSuccessor(0));
            // 将case值保存到局部变量中
            new StoreInst(numCase, swVarPtr, BB->getTerminator());
            // 删除基本块的跳转指令
            BB->getTerminator()->eraseFromParent();
            // 在基本块中添加跳转指令，跳转到返回块
            BranchInst::Create(returnBB, BB);
        }
        else if (BB->getTerminator()->getNumSuccessors() == 2) // 如果基本块有两个后继基本块，则将调度变量的值设置为随机数
        {
            ConstantInt *numCase1 = swInst->findCaseDest(BB->getTerminator()->getSuccessor(0));                    // 获取switch指令中的case值
            ConstantInt *numCase2 = swInst->findCaseDest(BB->getTerminator()->getSuccessor(1));                    // 获取switch指令中的case值
            BranchInst *br = cast<BranchInst>(BB->getTerminator());                                                // 获取基本块的跳转指令
            SelectInst *sel = SelectInst::Create(br->getCondition(), numCase1, numCase2, "", BB->getTerminator()); // 创建选择指令
            new StoreInst(sel, swVarPtr, BB->getTerminator());                                                     // 将选择指令的结果保存到局部变量中
            BB->getTerminator()->eraseFromParent();                                                                // 删除基本块的跳转指令
            BranchInst::Create(returnBB, BB);                                                                      // 在基本块中添加跳转指令，跳转到返回块
        }
    }

    // 第五部修复PHI指令和逃逸变量
    fixStack(F);
}

char Flattening::ID = 0;
static RegisterPass<Flattening> X("fla", "Flatten the basic blocks in each function.");
