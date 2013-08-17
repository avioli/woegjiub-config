" Vim color file
" Maintainer:	Chris Darko <chris.j.darko@gmail.com>
" Last Change:	2012-08-10

"gives defaults for a dark colorscheme
set background=dark
hi clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name = "darko"

" I have very few colour preferences for now :p
hi LineNr		ctermfg=8
hi StatusLine	ctermfg=0	ctermbg=7 cterm=none

if has('gui_running')
	hi Normal guifg=gray guibg=black
	hi Cursor guibg=white
	set guifont=Liberation\ Mono\ 9
	set guiheadroom=0
	set go=ac
endif
