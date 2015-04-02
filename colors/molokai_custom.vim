" Vim color file
"
" Author: Santiago Romero @sromeroi

set background=dark

match Todo /Todo:\|TODO:/

" Customize this colour scheme
hi Search ctermfg=black ctermbg=Yellow guifg=black guibg=Yellow cterm=NONE gui=NONE
hi Comment ctermfg=darkblue ctermbg=NONE cterm=NONE guifg=#75715e guibg=NONE gui=NONE
hi Normal ctermfg=231 ctermbg=black cterm=NONE guifg=#f8f8f2 guibg=#272822 gui=NONE
hi Statement       ctermfg=red               cterm=NONE
hi Conditional     ctermfg=161               cterm=NONE
hi Constant        ctermfg=135               cterm=NONE
hi String ctermfg=186 ctermbg=NONE cterm=NONE guifg=#e6db74 guibg=NONE gui=NONE

hi ShowMarksHLl ctermfg=LightCyan ctermbg=NONE guifg=#40FF40 guibg=Black
hi ShowMarksHLu ctermfg=LightCyan ctermbg=NONE guifg=#40FF40 guibg=Black
hi SignColumn ctermfg=Blue ctermbg=NONE guifg=Blue guibg=Black
hi Folded ctermfg=black ctermbg=gray guifg=black guibg=gray
hi LineNr ctermfg=darkgray ctermbg=black
hi CursorLineNr ctermfg=brown ctermbg=black
hi Visual ctermfg=black ctermbg=gray
hi Todo ctermbg=Yellow ctermfg=Black guifg=Black guibg=Yellow gui=bold cterm=bold

