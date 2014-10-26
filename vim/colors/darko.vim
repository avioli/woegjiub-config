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

" UI
hi ColorColumn ctermfg=NONE ctermbg=52 cterm=NONE
hi LineNr ctermfg=8 ctermbg=NONE cterm=NONE
hi StatusLine ctermfg=0 ctermbg=7 cterm=NONE

" General
hi Comment ctermfg=8 ctermbg=NONE cterm=NONE
hi Conditional ctermfg=129 ctermbg=NONE cterm=bold
hi Function ctermfg=5 ctermbg=NONE cterm=bold
hi Operator ctermfg=90 ctermbg=NONE cterm=bold
hi Statement ctermfg=4 ctermbg=NONE cterm=bold
hi String ctermfg=8 ctermbg=NONE cterm=NONE

" Python
hi PythonBuiltin ctermfg=105 ctermbg=NONE cterm=bold

" HTML
hi HtmlTag ctermfg=5 ctermbg=NONE cterm=bold
hi HtmlEndTag ctermfg=5 ctermBG=NONE cterm=bold
hi HtmlTagName ctermfg=4 ctermbg=NONE cterm=bold

if has('gui_running')
	hi Normal guifg=gray guibg=black
	hi Cursor guibg=white
	set guifont=Liberation\ Mono\ 9
	set guiheadroom=0
	set go=ac
endif
