#!/bin/bash

# Symlink .vimrc
ln -s $(pwd)/vimrc ~/.vimrc

# Setup Vundle
[[ -d ~/.vim/bundle ]] || mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
