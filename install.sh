#!/bin/sh

echo -e "\n--- vimfiles install script ---"

NOW=$(date +%Y%m%d_%H%M)
echo -e "\n* Getting Vundle..."
mkdir -p bundle/
if [ ! -d $PWD/bundle/vundle ]; 
then
    git clone https://github.com/gmarik/Vundle.vim.git $PWD/bundle/vundle
fi

echo -e "\n* Symlinking vimrc..."
if [ -e ~/.vimrc ];
then
    mv ~/.vimrc ~/.vimrc.$NOW
fi
if [ -e ~/.gvimrc ];
then
    mv ~/.gvimrc ~/.gvimrc.$NOW
fi

ln -s $PWD/vimrc ~/.vimrc
ln -s $PWD/gvimrc ~/.gvimrc

echo -e "\n* Fetching Bundles..."
vim +PluginInstall +qall

echo -e "\n--- done! ---\n"

