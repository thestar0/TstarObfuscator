/*
这是一个简单的LLVM Pass，它会在编译时打印出每个函数的名字。
这个Pass的实现非常简单，它只需要继承FunctionPass类并实现runOnFunction方法即可。
*/

#include "llvm/Pass.h"//包含Pass头文件
#include "llvm/IR/Function.h"//包含Function头文件
#include "llvm/Support/raw_ostream.h"//包含raw_ostream头文件
using namespace llvm;//使用llvm命名空间

namespace{
    class HelloWorld : public FunctionPass{
        public:
            static char ID;//Pass的ID
            HelloWorld() : FunctionPass(ID){}//构造函数
            
            bool runOnFunction(Function&F);   //重写runOnFunction方法           
    };
}

bool HelloWorld::runOnFunction(Function &F){//重写runOnFunction方法
    //todo
    outs() << "Hello," << F.getName() << "\n";//输出函数名
}
char HelloWorld::ID = 0;//初始化ID
static RegisterPass<HelloWorld> X("hlw","My frist line of LLVM Pass");//注册Pass
