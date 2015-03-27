#!/bin/bash
#
# This scripts downloads in .vim/bundle/ all the vim scripts
# hosted in github. It also deletes any folder from bundle/
# that is not declared here. 
#
# ***OBSOLETE***
# This script was meant to use with PATHOGEN. I'm moved to
# Vundle now and everything is handled automatically, but I
# keep this in the "old/" directory for archiving purposes.
#
# 
# sromero - March 2015
#
#

echo "ERROR: ***Script is deprecated***"
echo "This script was designed for pathogen (now Vundle is being used)."
echo "Aborting..."
exit 0


DOS2UNIX=$(which dos2unix)
CWD=$(pwd)

# Plugins to be downloaded from git
declare -a gitplugins=(
    "https://github.com/myusuf3/numbers.vim.git"
    "https://github.com/majutsushi/tagbar.git" 
    "https://github.com/godlygeek/tabular.git"
    "https://github.com/Townk/vim-autoclose.git"
    "https://github.com/scrooloose/nerdcommenter.git"
    "https://github.com/scrooloose/syntastic.git"
    "https://github.com/joonty/vdebug.git"
    "https://github.com/mileszs/ack.vim.git"
    "https://github.com/vim-scripts/Command-T.git"
    "https://github.com/kien/ctrlp.vim.git"
    "https://github.com/sjl/gundo.vim.git"
    "https://github.com/scrooloose/nerdtree.git"
    "https://github.com/garbas/vim-snipmate.git"
    "https://github.com/ervandew/supertab.git"
    "https://github.com/vim-scripts/TaskList.vim.git"
    "https://github.com/altercation/vim-colors-solarized.git"
    "https://github.com/tomtom/tlib_vim.git"
    "https://github.com/MarcWeber/vim-addon-mw-utils.git"
    "https://github.com/garbas/vim-snipmate.git"
               )

# Plugins to keep because they were added manually
declare -a otherplugins=(
    "test"
               )


#-----------------------------------------------------------
# Downloads a plugin from a given GITHUB URL into bundle/
#-----------------------------------------------------------
function DownloadGIT {
   local URL="$1"
   local DIR="$2"

   if [ -d "${DIR}" ];
   then
     cd ${DIR} && git pull 
     cd $CWD
   else
     git clone "$URL" "$DIR"
   fi

   if [ "${DOS2UNIX}x" != "x" ];
   then
       find "$DIR" -name "*.vim" -exec $DOS2UNIX -q "{}" \;
   fi
}


#-----------------------------------------------------------
# Check if the given directory name under /bundle ($1) is
# a plugin present in the gitplugins or otherplugins arrays.
# Returns 0 = not present, 1 = present.
#-----------------------------------------------------------
function validPlugin () {
  local e
  local DIR

  for e in "${gitplugins[@]}"; do 
     DIR="$(basename "${e}" | sed -e 's/vim-//g' -e 's/\.git//g' -e 's/\.vim//g')"
     [[ "$DIR" == "$1" ]] && return 1; 
  done

  for e in "${otherplugins[@]}"; do 
     DIR="$(basename "${e}" | sed -e 's/vim-//g' -e 's/\.git//g' -e 's/\.vim//g')"
     [[ "$DIR" == "$1" ]] && return 1; 
  done

  return 0
}


#-----------------------------------------------------------
# Main program
#-----------------------------------------------------------
if [ "$(basename $CWD)x" != ".vimx" ];
then
   echo "ERROR: Run this script right inside a $HOME/.vim directory!"
   exit 1
fi

echo "--- Update vim plugins bundle... ---"

mkdir -p bundle

# Delete directories not defined above
find bundle -maxdepth 1 -mindepth 1 -type d -exec basename {} \; | \
      while read DIR;
do
    if [ "${DIR}x" == "/x" ] || [ "${DIR}x" == "x" ];
    then
       continue
    fi

    validPlugin "$DIR"
    if [ "$?" == "0" ];
    then
        echo -e "\n* Deleting 'bundle/${DIR}' (not present in gitplugins|otherplugins)..."
        echo rm -Rf "bundle/${DIR}"
    fi
done

# Download plugins
for URL in "${gitplugins[@]}"
do
   DIR="bundle/$(basename "${URL}" | sed -e 's/vim-//g' -e 's/\.git//g' -e 's/\.vim//g')"
   echo -e "\n* Updating or downloading '${DIR}' ..."
   DownloadGIT "${URL}" "${DIR}"
done

echo -e "\n[done]\n"
