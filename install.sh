#!/bin/bash

git submodule init
git submodule update --init --recursive

\mkdir ~/.backup
[[ -f ~/.vimrc ]] && mv ~/.vimrc ~/.backup/.vimrc
[[ -d ~/.vim ]] &&  mv ~/.vim ~/.backup/.vim
[[ -d ~/.tmux ]] && mv ~/.tmux ~/.backup/.tmux
[[ -f ~/.tmux.conf ]] && mv ~/.tmux.conf ~/.backup/.tmux.conf
[[ -f ~/.bash.conf ]] && mv ~/.bash.conf ~/.backup/.bash.conf
[[ -d ~/.bash_addons ]] && mv ~/.bash_addons ~/.backup/.bash


GIT_ROOT=$(git rev-parse --show-toplevel)

ln -s ${GIT_ROOT}/vimrc ~/.vimrc
ln -s ${GIT_ROOT}/vim ~/.vim
ln -s ${GIT_ROOT}/tmux ~/.tmux
ln -s ${GIT_ROOT}/tmux.conf ~/.tmux.conf
ln -s ${GIT_ROOT}/bash.conf ~/.bash.conf
ln -s ${GIT_ROOT}/bash ~/.bash_addons

echo "source ~/.bash.conf" >> ~/.bashrc

# Git
echo "[include]" >> ~/.gitconfig
echo "path = ${GIT_ROOT}/gitconfig" >> ~/.gitconfig


# gdb 
echo "source ${GIT_ROOT}/gdbinit" >> ~/.gdbinit
