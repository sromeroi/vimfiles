#!/bin/sh

echo "* Getting Vundle..."
git submodule update --init

echo "* Symlinking vimrc..."
ln -s $PWD/vimrc ~/.vimrc
ln -s $PWD/gvimrc ~/.gvimrc

echo "* Fetching Bundles..."
vim +PluginInstall +qall

