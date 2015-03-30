#!/bin/bash
#
# Update plugins with Vundle.
#

echo -e "\n--- Update Vundle plugins ---"

if [ ! -e vimrc ] || [ ! -e install.sh ];
then
    echo -e "\nERROR: You must be inside the .vim directory to launch install.sh.\n"
    exit 1
fi

echo -e "\n* Updating Bundles (Plugins) configured in the vimrc file..."
vim +PluginInstall +qall

echo -e "\n--- done! ---\n"

