""" Common options for .vimrc and .gvimrc

"filetype plugin on
set tabstop=4
set nobackup
set sw=4
set ai
set sm
set ruler
set nocompatible
set vb
set novisualbell
set noerrorbells
set ttyfast
set expandtab
set wrap
set laststatus=2
set number
"set incsearch
"set mouse+=a

""" Load pathogen plugins
filetype off
let mapleader=","
call pathogen#infect()
call pathogen#helptags()

filetype plugin on
syntax on
hi Visual ctermfg=black ctermbg=white guifg=black guibg=white

""" Showmars a-z in a given colour:
"let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
let g:showmarks_include="abcdefghijklmnopqrstuvwxyz"
highlight ShowMarksHLl ctermfg=LightCyan ctermbg=NONE guifg=#40FF40 guibg=Black
highlight ShowMarksHLu ctermfg=LightCyan ctermbg=NONE guifg=#40FF40 guibg=Black
highlight SignColumn ctermfg=Blue ctermbg=NONE guifg=Blue guibg=Black

""" Hide the Showmarks column by removing all the symbols
nmap <F7> <ESC>:sign unplace *<CR>:delm!<CR>:delm A-Z0-9<CR>

""" Toggle Relative and Absolute line numbers
" Enable / Disable line numbers
nmap <leader>l <Esc>:set nu<CR>:set rnu<CR>
nmap <leader>L <Esc>:set nonu<CR>:set nornu<CR>
nnoremap <F3> :NumbersToggle<CR>
let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']

""" Highlight the current cursor line
"set cursorline
"nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
"hi CursorColumn cterm=NONE ctermbg=darkgray ctermfg=white guibg=darkgray guifg=white
hi CursorLine   cterm=NONE ctermbg=darkgray ctermfg=NONE guibg=darkgray guifg=white
nnoremap <Leader>c :set cursorline!<CR>

""" Ctrl+N 2 times toggles line numbers
"imap <C-N><C-n> :set invnumber<CR>

""" Open files in the last known position
if has("autocmd")
        autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
endif

" Vim plugins!
nmap <leader>f <Esc>:Ack!
map <Leader>td <Plug>TaskList
"map <leader>g :GundoToggle<CR>

" Tab completion. Use CTRL+V and TAB to insert a real tab.
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" Split windows Ctrl+w - v and Ctrl+w - s and use Ctrl+w - cursor to change
" Use Ctrl+w - q to close current windiow.
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Buffer plugins. Use :e file to open a new buffer then :bX to change
" to buffer X. With :bd you delete the current buffer and with :buffers
" you can see a buffer list.
map <c-b> :b
map <leader>o :bp<CR>
map <leader>p :bn<CR>
map <leader>D :BD<CR>
map <leader><left> :bp<CR>
map <leader><right> :bn<CR>
""map <leader><ESC> :BD<CR>

" Nerd Tree
let g:NERDTreeWinPos = "right"
map <leader>n :NERDTreeToggle<CR>
map <C-n> :NERDTreeToggle<CR>
map <F1> :NERDTreeToggle<CR>

" Insert blank line between lines for readability purposes (logs)
map <leader>G <ESC>set noai<CR><ESC>:g/.\n\n\@!/norm o<CR>

" Open nertree automatically on vim startup
" autocmd vimenter * NERDTree
" Then go to previous (last accessed) window.
" autocmd VimEnter * wincmd p

" Open nerdtree automatically if no file is specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if nertree is the only window opened
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q! | endif

" Fuzzy search
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" vim-autoclose
let b:AutoCloseOn = 0
nmap <leader>x <ESC>:AutoCloseToggle<CR>

""autocmd BufNewFile,BufRead *.module,*.php,*.install,*.test set filetype=php
""autocmd BufNewFile,BufRead *.sql,*.dump set filetype=sql

""" Use <space> for folding in visual and normal mode
set foldmethod=manual
vmap <space> zf
nmap <space> za
""" folding colour
highlight Folded ctermfg=black ctermbg=gray guifg=black guibg=gray
""" Remove line number from code folding
set foldtext=getline(v:foldstart)
highlight LineNr ctermfg=darkgray ctermbg=black
highlight CursorLineNr ctermfg=darkgray ctermbg=black

"autocmd BufWinLeave ?* mkview
""autocmd BufWinEnter ?* silent loadview
autocmd BufWinLeave *.module,*.inc,*.h,*.c,*.css,*.js,*.sh,*.php,*.py mkview
autocmd BufWinEnter *.module,*.inc,*.h,*.c,*.css,*.js,*.sh,*.php,*.py silent loadview

""" Autosave file folds
set foldmethod=manual
set viewoptions=folds

" colours!
set background=dark
colorscheme molokai_sromero

