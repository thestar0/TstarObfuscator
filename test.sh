cd ./Build
cmake ../Transforms
make
cd ../Test
clang -S -emit-llvm TestProgram.cpp -o IR/TestProgram.ll
opt -load ../Build/LLVMObfuscator.so -hlw -S IR/TestProgram.ll -o IR/TestProgram_hlw.ll
clang IR/TestProgram_hlw.ll -o Bin/TestProgram_hlw
./Bin/TestProgram_hlw flag{s1mpl3_11vm_d3m0} 

echo "------------------Split Basic Block(基本块分割)--------------------------"
opt -load ../Build/LLVMObfuscator.so -split -S IR/TestProgram.ll -o IR/TestProgram_split.ll
clang IR/TestProgram_split.ll -o Bin/TestProgram_split
./Bin/TestProgram_split flag{s1mpl3_11vm_d3m0}

echo "------------------Control Flow Flattening(控制流平坦化)------------------"
opt -lowerswitch -S IR/TestProgram.ll -o IR/TestProgram_lowerswitch.ll
opt -load ../Build/LLVMObfuscator.so -fla -S IR/TestProgram_lowerswitch.ll -o IR/TestProgram_fla.ll
clang IR/TestProgram_fla.ll -o Bin/TestProgram_fla
./Bin/TestProgram_fla flag{s1mpl3_11vm_d3m0}
echo "------------------Bogus Control Flow(虚假控制流)-------------------------"
opt -load ../Build/LLVMObfuscator.so -bcf -bcf_loop 2 -S IR/TestProgram.ll -o IR/TestProgram_bcf.ll
clang IR/TestProgram_bcf.ll -o Bin/TestProgram_bcf
./Bin/TestProgram_bcf flag{s1mpl3_11vm_d3m0}
echo "------------------Substitution(指令替代)---------------------------------"
opt -load ../Build/LLVMObfuscator.so -sub -sub_loop 3 -S IR/TestProgram.ll -o IR/TestProgram_sub.ll
clang IR/TestProgram_sub.ll -o Bin/TestProgram_sub
./Bin/TestProgram_sub flag{s1mpl3_11vm_d3m0}
echo "------------------Random Control Flow(随机控制流)------------------------"
opt -load ../Build/LLVMObfuscator.so -rcf -rcf_loop 2 -S IR/TestProgram.ll -o IR/TestProgram_rcf.ll
llc -filetype=obj -mattr=+rdrnd IR/TestProgram_rcf.ll -o Bin/TestProgram_rcf.o
clang Bin/TestProgram_rcf.o -o Bin/TestProgram_rcf
./Bin/TestProgram_rcf flag{s1mpl3_11vm_d3m0}
echo "------------------Constant Substitution(常量替代)------------------------"
opt -load ../Build/LLVMObfuscator.so -csub -csub_loop 3 -S IR/TestProgram.ll -o IR/TestProgram_csub.ll
clang IR/TestProgram_csub.ll -o Bin/TestProgram_csub
./Bin/TestProgram_csub flag{s1mpl3_11vm_d3m0}
