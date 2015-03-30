# sromeroi's vimfiles

My Vim configuration resources (.vim directory tree).

This repository is intended as a backup of my Vim configuration files and as
a quick way to easily deploy and update my vim configurations in multiple
computers.

Uses Vundle for plugin management and includes some "customized" colour schemes.

### Installation instructions

* Rename ~/.vim as ~/vim.old.

```
    mv ~/.vim ~/vim.old
```

* Clone this repository as ~/.vim

```
    git clone https://github.com/sromeroi/vimfiles.git ~/.vim
```

* Check the install.sh script and then run it (it will rename your ~/.vimrc and ~/.gvimrc files and download the required plugins).

```
    # cd ~/.vim/
    # cat install.sh 
    (always check what a downloaded script does in your system!)
    # bash install.sh
```
* Profit!


### How to use this repo as a base for your own vimfiles repo

Just delete the ~/.vim/.git folder. Then you can upload the .vim folder to your github and bitbucket account following the instructions defined in those sites.


