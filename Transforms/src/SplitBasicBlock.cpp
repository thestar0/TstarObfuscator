/*
这是一个简单的LLVM Pass，它会在编译时打印出每个函数的名字。
这个Pass的实现非常简单，它只需要继承FunctionPass类并实现runOnFunction方法即可。
*/

#include "llvm/Pass.h"                //包含Pass头文件
#include "llvm/IR/Function.h"         //包含Function头文件
#include "llvm/Support/raw_ostream.h" //包含raw_ostream头文件
#include "llvm/IR/Instructions.h"
#include "llvm/Support/CommandLine.h"
#include "SplitBasicBlock.h"
#include <vector>
using std::vector;
using namespace llvm; // 使用llvm命名空间

static cl::opt<int> splitNum("split_num", cl::init(2), cl::desc("Split<split_num> time(s) each BB"));

namespace
{
    class SplitBasicBlock : public FunctionPass
    {
    public:
        static char ID;                         // Pass的ID
        SplitBasicBlock() : FunctionPass(ID) {} // 构造函数

        bool runOnFunction(Function &F); // 重写runOnFunction方法

        bool containsPHI(BasicBlock *BB);

        void split(BasicBlock *BB);
    };
}

bool SplitBasicBlock::runOnFunction(Function &F)
{ // 重写runOnFunction方法
    // todo
    vector<BasicBlock *> origBB;
    for (BasicBlock &BB : F)
    {
        origBB.push_back(&BB);
    }
    for (BasicBlock *BB : origBB)
    {
        if (!containsPHI(BB))
        {
            split(BB);
        }
    }
}

bool SplitBasicBlock::containsPHI(BasicBlock *BB)
{
    for (Instruction &I : *BB)
    {
        if (isa<PHINode>(&I))
        {
            return true;
        }
    }
    return false;
}
void SplitBasicBlock::split(BasicBlock *BB)
{
    // 计算分裂后每个基本块的大小
    // 原基本块的大小 / 分裂数目（向上取整）
    int splitSize = (BB->size() + splitNum - 1) / splitNum;

    BasicBlock *curBB = BB;
    for (int i = 1; i < splitNum; i++)
    {
        int cnt = 0;
        for (Instruction &I : *curBB)
        {
            if (cnt++ == splitSize)
            {
                // 在 I 指令处对基本块进行分割
                curBB = curBB->splitBasicBlock(&I);
                break;
            }
        }
    }
}
FunctionPass* llvm::createSplitBasicBlockPass(){
    return new SplitBasicBlock();
}

char SplitBasicBlock::ID = 0;                                                                      // 初始化ID
static RegisterPass<SplitBasicBlock> X("split", "Split a basic block intomultiple basic blocks."); // 注册Pass
