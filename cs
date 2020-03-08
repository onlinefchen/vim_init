#!/bin/sh


find  `pwd`/ -name "*.c" -o -name "*.h" -o -name "*.cpp" -o -name "*.java" -o -name "*.S" -o -name "*.s" -o -name "*.cs" >~/.vim/cscope/cscope.files

cscope -bkq -i ~/.vim/cscope/cscope.files
mv ./cscope.out ~/.vim/cscope.out
mv ./cscope.in.out ~/.vim/cscope.in.out
mv ./cscope.po.out ~/.vim/cscope.po.out
