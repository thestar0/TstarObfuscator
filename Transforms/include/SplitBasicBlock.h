#ifndef SPLIT_BASIC_BLOCK_H
#define SPLIT_BASIC_BLOCK_H

#include "llvm/IR/Function.h"
#include "llvm/Pass.h"
namespace llvm
{
    FunctionPass *createSplitBasicBlockPass();
}
#endif
