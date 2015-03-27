#!/bin/sh
#
# Setup the vimfiles repository: downloads Vundle, 
#

NOW=$(date +%Y%m%d_%H%M)

echo -e "\n--- vimfiles install script ---"

if [ ! -e vimrc ] || [ ! -e install.sh ];
then
    echo -e "\nERROR: You must be inside the .vim directory to launch install.sh.\n"
    exit 1
fi

echo -e "\n* Downloading Vundle plugin (from github)..."
mkdir -p bundle/
if [ ! -e bundle/vundle/autoload/vundle.vim ];
then
    git clone https://github.com/gmarik/Vundle.vim.git bundle/vundle
fi

echo -e "\n* Symlinking ~/.vimrc to ~/.vim/vimrc (also gvimrc)..."

# Files: make a backup. Symlinks: check if they're already OK
for FILE in vimrc gvimrc; do
    if [ -f ~/.${FILE} ] && [ ! -L ~/.${FILE} ];
    then
        mv ~/.${FILE} ~/${FILE}.${NOW}
    fi
    if [ -L ~/.${FILE} ];
    then
        DESTLINK=$(readlink -f ~/.${FILE})
        if [ "$DESTLINK" != "${PWD}/${FILE}" ];
        then 
            rm -f ~/.${FILE}
        else
            continue
        fi
    fi
    ln -s ${PWD}/${FILE} ~/.${FILE}
done

echo -e "\n* Fetching Bundles (Plugins) configured in the vimrc file..."
vim +PluginInstall +qall

echo -e "\n--- done! ---\n"

