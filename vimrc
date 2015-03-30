" sromeroi vimrc settings
"----------------------------------------------------------------------
" Author: Santiago Romero - @sromeroi 
"         http://github.com/sromeroi/vimfiles
"
" CHANGELOG: 
"
" v1.1     2015-03-29
"          * Several changes to vimrc, added update/clean scripts.
"
" v1.0     2015-03-26
"          * Switch from pathogen to vundle for plugin management.
"          * Lots of changes to vimrc file.
"          * Thanks to Makigas for his vimrc-setup youtube video!
"          * Uploaded to github (previously in bitbucket).
"
"----------------------------------------------------------------------

set nocompatible

"----------------------------------------------------------------------
" VUNDLE
"----------------------------------------------------------------------
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Plugin 'myusuf3/numbers.vim'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar' 
Plugin 'godlygeek/tabular'
Plugin 'Townk/vim-autoclose'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'joonty/vdebug'
Plugin 'mileszs/ack.vim'
Plugin 'vim-scripts/Command-T'
Plugin 'kien/ctrlp.vim'
Plugin 'sjl/gundo.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'vim-scripts/TaskList.vim'
Plugin 'vim-scripts/ShowMarks'
Plugin 'vim-scripts/bufkill.vim'
Plugin 'garbas/vim-snipmate'
" Snipmate requirements:
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
" Vundle:
Plugin 'gmarik/Vundle.vim', {'name': 'vundle'}

" Colour schemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'benjaminwhite/Benokai'
Plugin 'sickill/vim-monokai'
Plugin 'morhetz/gruvbox'

call vundle#end()
filetype plugin indent on

"----------------------------------------------------------------------
" Generic options
"----------------------------------------------------------------------
set nobackup
set ruler
set novisualbell
set noerrorbells
set ttyfast
set nowrap
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
"set softtabstop=4
set laststatus=2
set number
set wildmenu
"set incsearch
set showmatch
"set cursorline
"set cursorcolumn
"set mouse+=a

set encoding=utf-8
set backspace=indent,eol,start

let mapleader=","
filetype plugin on

autocmd FileType html,css,sass,scss,javascript,json 
      \ setlocal shiftwidth=2 softtabstop=2

" Tab completion. Use CTRL+V and TAB to insert a real tab.
autocmd FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

""" Showmars a-z in a given colour:
"let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
let g:showmarks_include="abcdefghijklmnopqrstuvwxyz"

""" Hide the Showmarks column by removing all the symbols
nmap <F7> <ESC>:sign unplace *<CR>:delm!<CR>:delm A-Z0-9<CR>
nmap <leader>hs <ESC>:sign unplace *<CR>:delm!<CR>:delm A-Z0-9<CR>

""" Toggle Relative and Absolute line numbers
" Enable / Disable line numbers
nmap <leader>l <Esc>:set nu<CR>:set rnu<CR>
nmap <leader>L <Esc>:set nonu<CR>:set nornu<CR>
nnoremap <F3> :NumbersToggle<CR>
let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']

""" Highlight the current cursor line
nnoremap <Leader>cl :set cursorline!<CR>
nnoremap <Leader>cc :set cursorcolumn!<CR>

""" Open files in the last known position
if has("autocmd")
        autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
endif

" Vim plugins!
map <Leader>td <Plug>TaskList
map <Leader>todo <Plug>TaskList
map <Leader>tasklist <Plug>TaskList
"map <leader>g :GundoToggle<CR>

let g:tagbar_width = 20
nmap <leader>t :TagbarToggle<CR>
nmap <leader>tags :TagbarToggle<CR>
nmap <leader>tagbar :TagbarToggle<CR>
map <F8> <ESC>:TagbarToggle<CR>

"imap <C-C> <Plug>snipMateNextOrTrigger
"smap <C-C> <Plug>snipMateNextOrTrigger

" Split windows Ctrl+w - v and Ctrl+w - s and 
"               Ctrl+w - cursor to change
" Use Ctrl+w - q to close current windiow.
" Maps for Ctrl+h/j/k/l to move.
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Buffer plugins. Use :e file to open a new buffer then :bX to change
" to buffer X. With :bd you delete the current buffer and with :buffers
" you can see a buffer list.
"map <c-b> :b
map <leader>o :bp<CR>
map <leader>p :bn<CR>
map <leader>D :BD<CR>
map <leader><left> :bp<CR>
map <leader><right> :bn<CR>

" Insert blank line between lines for readability purposes (logs)
map <leader>G <ESC>set noai<CR><ESC>:g/.\n\n\@!/norm o<CR>

" Nerd Tree
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = 25
nmap <leader>n :NERDTreeToggle<CR>
map <F1> <ESC>:NERDTreeToggle<CR>

" Open nertree automatically on vim startup
" autocmd vimenter * NERDTree
" Then go to previous (last accessed) window.
" autocmd VimEnter * w,incmd p

" Open nerdtree automatically if no file is specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if nertree is the only window opened
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && 
        \ b:NERDTreeType == "primary") | q! | endif

" Fuzzy search
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" vim-autoclose
let b:AutoCloseOn = 0
nmap <leader>ac <ESC>:AutoCloseToggle<CR>
nmap <leader>autoclose <ESC>:AutoCloseToggle<CR>

""" Use <space> for folding in visual and normal mode
set foldmethod=manual
vmap <space> zf
nmap <space> za
""" Remove line number from code folding
set foldtext=getline(v:foldstart)

autocmd BufWinLeave ?* mkview
""autocmd BufWinEnter ?* silent loadview
autocmd BufNewFile,BufRead *.module,*.php,*.install,*.test set filetype=php
autocmd BufNewFile,BufRead *.sql,*.dump set filetype=sql
autocmd BufWinLeave *.module,*.inc,*.h,*.c,*.css,*.js,*.sh,*.php,*.py mkview
autocmd BufWinEnter *.module,*.inc,*.h,*.c,*.css,*.js,*.sh,*.php,*.py silent loadview

""" Autosave file folds
set foldmethod=manual
set viewoptions=folds

" Colours
if &t_Co > 2 || has("gui_running")
    syntax on
endif

if &t_Co == 256 || has("gui_running")
    set background=dark
    let s:scriptpath = fnamemodify(resolve(expand('<sfile>:p')), ':h')

    let s:myscheme = "molokai"

    " Check if colour scheme is present
    let s:schemepath = s:scriptpath . '/bundle/' . s:myscheme . '/colors/' . s:myscheme . '.vim'
    if filereadable( s:schemepath )
        exec "colorscheme " . s:myscheme
    endif

    " Check if custom changes to this schema are present
    let s:customcolors = s:scriptpath . '/colors/' . s:myscheme . '_custom.vim'
    if filereadable( s:customcolors )
        exec "source " . s:customcolors 
    endif
    set colorcolumn=80
endif

