#!/bin/sh

if [[ -e "~/.vimrc" ]]; then
  rm ~/.vimrc
fi 

ln -s .vimrc ~/.vimrc
