#!/bin/sh


find  `pwd`/ -name "*.c" -o -name "*.h" -o -name "*.cpp" -o -name "*.java" -o -name "*.S" -o -name "*.s" -o -name "*.cs" >~/cscope/cscope.files

cscope -bkq -i ~/cscope/cscope.files
mv ./cscope.out ~/cscope/cscope.out
mv ./cscope.in.out ~/cscope/cscope.in.out
mv ./cscope.po.out ~/cscope/cscope.po.out
