#!/bin/bash

# 1 -- symlink the rc
ln   ~/configs/vim/.vimrc  ~/.vimrc

# 2 -- cp theme into colors
mkdir -p ~/.vim/colors
cp readability.vim  ~/.vim/colors/readability.vim

