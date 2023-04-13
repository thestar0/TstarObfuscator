#include "Utils.h"
#include <vector>
#include "llvm/IR/Instructions.h"
#include "llvm/Transforms/Utils/Local.h"
#include "llvm/Transforms/Utils/ValueMapper.h"
#include "llvm/Transforms/Utils/Cloning.h"
using std::vector;
using namespace llvm;

LLVMContext *CONTEXT = nullptr;
// 第五步修复 PHI 指令和逃逸变量
void llvm::fixStack(Function &F) // 将函数F中的所有PHI指令和逃逸变量转换为栈变量
{
    vector<PHINode *> origPHI;               // 保存函数F中的所有PHI指令
    vector<Instruction *> origReg;           // 保存函数F中的所有逃逸变量
    BasicBlock &entryBB = F.getEntryBlock(); // 获取函数F的入口块
    for (BasicBlock &BB : F)                 // 遍历函数F中的所有基本块
    {
        for (Instruction &I : BB) // 遍历基本块BB中的所有指令
        {
            if (PHINode *PN = dyn_cast<PHINode>(&I)) // 判断指令I是否是PHI指令
            {
                origPHI.push_back(PN); // 将PHI指令保存到vector容器中
            }
            else if (!(isa<AllocaInst>(&I) && I.getParent() == &entryBB) && I.isUsedOutsideOfBlock(&BB)) // 判断指令I是否是逃逸变量
            {
                origReg.push_back(&I); // 将逃逸变量保存到vector容器中
            }
        }
    }

    for (PHINode *PN : origPHI) // 遍历vector容器中的所有PHI指令
    {
        DemotePHIToStack(PN, entryBB.getTerminator()); // 将PHI指令转换为栈变量
    }
    for (Instruction *I : origReg) // 遍历vector容器中的所有逃逸变量
    {
        DemoteRegToStack(*I, entryBB.getTerminator()); // 将逃逸变量转换为栈变量
    }
}
BasicBlock *llvm::createCloneBasicBlock(BasicBlock *BB)
{
    // 修复逃逸变量
    //  保存函数F中的所有PHI指令
    vector<Instruction *> origReg;                          // 保存函数F中的所有逃逸变量
    BasicBlock &entryBB = BB->getParent()->getEntryBlock(); // 获取函数F的入口块
    for (Instruction &I : *BB) // 遍历基本块BB中的所有指令
    {
        if (!(isa<AllocaInst>(&I) && I.getParent() == &entryBB) && I.isUsedOutsideOfBlock(BB)) // 判断指令I是否是逃逸变量
        {
            origReg.push_back(&I); // 将逃逸变量保存到vector容器中
        }
    }

    for (Instruction *I : origReg) // 遍历vector容器中的所有逃逸变量
    {
        DemoteRegToStack(*I, entryBB.getTerminator()); // 将逃逸变量转换为栈变量
    }

    ValueToValueMapTy VMap;
    BasicBlock *cloneBB = CloneBasicBlock(BB, VMap, "cloneBB", BB->getParent());
    for (Instruction &I : *cloneBB)
    {
        for (int i = 0; i < I.getNumOperands(); i++)
        {
            Value *V = MapValue(I.getOperand(i), VMap);
            if (V)
            {
                I.setOperand(i, V);
            }
        }
    }
    return cloneBB;
}
