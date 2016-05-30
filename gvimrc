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

" Some helpers to move among tabs
function MoveTabLeft()
   let tab_number = tabpagenr() - 1
   if tab_number == 0
      execute "tabm" tabpagenr('$') - 1
   else
      execute "tabm" tab_number - 1
   endif
endfunction

function MoveTabRight()
   let tab_number = tabpagenr() - 1
   let last_tab_number = tabpagenr('$') - 1
   if tab_number == last_tab_number
      execute "tabm" 0
   else
      execute "tabm" tab_number + 1
   endif
endfunction

" gvim size and colours
set lines=48
set columns=120
set t_Co=256
set background=dark
set colorcolumn=0

" Set font on Windows, Mac, Linux ...
if has("win32") || has("win64")
    
    "let $HOME="D:/Users/youruser"
    "set viminfo="1000,nD:/Users/youruser/_viminfo"
    
    """" SCP/SFTP edit
    "let g:netrw_cygwin = 0
    "let g:netrw_scp_cmd  = "D:/Users/youruser/bin/pscp -scp"
    "let g:netrw_sftp_cmd = "D:/Users/youruser/bin/pscp -sftp"
    "let g:netrw_silent = 1
   
    set guifont=Consolas:h11

elseif has("gui_gtk2")

    set guifont=Inconsolata-g\ Medium\ 11,DejaVu\ Sans\ Mono\ 10

elseif has("gui_macvim")

    set lines=45
    set columns=110
    set linespace=1
    set ruler
    set guifont=Inconsolata:h17

endif

