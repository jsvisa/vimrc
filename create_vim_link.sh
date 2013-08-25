#!/bin/sh

if [[ -f "~/.vimrc" ]]; then
  rm ~/.vimrc
fi 

ln -s .vimrc ~/.vimrc
