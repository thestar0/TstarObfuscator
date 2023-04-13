#参考官方文档：https://llvm.org/docs/CMake.html
#developing-llvm-passes-out-ofsource
project(OLLVM++)
cmake_minimum_required(VERSION 3.13.4)
find_package(LLVM REQUIRED CONFIG)
list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
include(AddLLVM)
include_directories("./include") # 包含 ./include 文件夹中的头文件
separate_arguments(LLVM_DEFINITIONS_LIST NATIVE_COMMAND ${LLVM_DEFINITIONS})
add_definitions(${LLVM_DEFINITIONS_LIST})
include_directories(${LLVM_INCLUDE_DIRS})
add_llvm_library( LLVMObfuscator MODULE
    src/HelloWorld.cpp #pass模板
    src/SplitBasicBlock.cpp#基本块分割
    src/Utils.cpp#工具函数
    src/Flattening.cpp#控制流平坦化
    src/BogusControlFlow.cpp#虚假控制流
    src/Substitution.cpp#指令替代
    src/RandomControlFlow.cpp#随机控制流
    src/ConstantSubstitution.cpp#常量替代
)
