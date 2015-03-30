#!/bin/bash
#
# Delete unused plugins with Vundle.
#

echo -e "\n--- Deleted unused Vundle plugins ---"

if [ ! -e vimrc ] || [ ! -e install.sh ];
then
    echo -e "\nERROR: You must be inside the .vim directory to launch install.sh.\n"
    exit 1
fi

echo -e "\n* Updating Bundles (Plugins) configured in the vimrc file..."
vim +PluginClean +qall

echo -e "\n--- done! ---\n"

