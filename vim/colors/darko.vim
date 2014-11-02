" Vim color file
" Maintainer:	Chris Darko <chris@chrisdarko.me>
" Last Change:	2014-10-29

"gives defaults for a dark colorscheme
set background=dark
hi clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name = "darko"

syntax match Operators display '[=]'
syntax match Braces display '[{}()\[\]]'

" UI
hi ColorColumn ctermfg=NONE ctermbg=5
hi LineNr ctermfg=8
hi NonText ctermfg=8
hi StatusLine ctermfg=0 ctermbg=7 cterm=NONE

" General
hi Braces ctermfg=5 cterm=bold
hi Comment ctermfg=240 cterm=italic
hi Conditional ctermfg=57 cterm=bold
hi Function ctermfg=5 cterm=bold
hi Number ctermfg=183
hi Operators ctermfg=90 cterm=bold
hi PreProc ctermfg=5 cterm=italic
hi Statement ctermfg=135 cterm=bold
hi String ctermfg=240 cterm=italic

" Python
hi PythonBuiltin ctermfg=104 ctermbg=NONE cterm=bold

" HTML
hi HtmlTag ctermfg=5 cterm=bold
hi HtmlEndTag ctermfg=5 cterm=bold
hi HtmlTagName ctermfg=4 cterm=bold

" Django
hi djangoArgument ctermfg=240 cterm=italic
hi djangoTagBlock ctermfg=99
hi djangoStatement ctermfg=135 cterm=bold
hi djangoVarBlock ctermfg=57

if has('gui_running')
	hi Normal guifg=gray guibg=black
	hi Cursor guibg=white
	set guifont=Liberation\ Mono\ 9
	set guiheadroom=0
	set go=ac
endif
