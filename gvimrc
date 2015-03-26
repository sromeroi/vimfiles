" sromeroi specific vimrc settings
"----------------------------------------------------------------------
" Author: Santiago Romero - @sromeroi
"         http://github.com/sromeroi/vimfiles
"
" CHANGELOG: 
"
" v1.0     2015-03-26
"          * File created.
"
"----------------------------------------------------------------------

" Disable toolbar
set guioptions-=T

" Set font on Windows, Mac, Linux ...
if has("win32") || has("win64")
    set guifont=Consolas:h11
elseif has("gui_gtk2")
    set guifont=Inconsolata-g\ Medium\ 11,DejaVu\ Sans\ Mono\ 10
elseif has("gui_macvim")
    set linespace=1
    set ruler
    set guifont=Inconsolata:h13
endif

