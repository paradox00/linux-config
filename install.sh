#!/bin/bash

mkdir ~/.backup
[[ -f ~/.vimrc ]] && mv ~/.vimrc ~/.backup/.vimrc
[[ -d ~/.vim ]] &&  mv ~/.vim ~/.backup/.vim
[[ -d ~/.tmux ]] && mv ~/.tmux ~/.backup/.tmux
[[ -f ~/.tmux.conf ]] && mv ~/.tmux.conf ~/.backup/.tmux.conf

GIT_ROOT=$(git rev-parse --show-toplevel)

ln -s ${GIT_ROOT}/vimrc ~/.vimrc
ln -s ${GIT_ROOT}/vim ~/.vim
ln -s ${GIT_ROOT}/tmux ~/.tmux
ln -s ${GIT_ROOT}/tmux.conf ~/.tmux.conf
