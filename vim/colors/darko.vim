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

au BufRead,BufNewFile * syntax match Operator display '[!\*\/,\.><:\-=\+]'
au BufRead,BufNewFile * syntax match Brace display '[{}()\[\]]'

" UI
hi ColorColumn ctermfg=16 ctermbg=56
hi Folded ctermfg=236 ctermbg=0 cterm=bold
hi LineNr ctermfg=8
hi NonText ctermfg=8
hi StatusLine ctermfg=0 ctermbg=7 cterm=NONE


" General
hi Brace ctermfg=5 cterm=bold
hi Comment ctermfg=240 cterm=italic
hi Conditional ctermfg=93 cterm=bold
hi Function ctermfg=5 cterm=bold
hi Number ctermfg=213
hi Operator ctermfg=57 cterm=bold
hi PreProc ctermfg=5 cterm=italic
hi SpecialKey ctermfg=8
hi Statement ctermfg=135 cterm=bold
hi String ctermfg=240 cterm=italic


" Python
hi PythonBuiltin ctermfg=140 ctermbg=NONE cterm=bold


" HTML
hi HtmlTag ctermfg=5 cterm=bold
hi HtmlEndTag ctermfg=5 cterm=bold
hi HtmlTagName ctermfg=4 cterm=bold


" Django
hi djangoArgument ctermfg=240 cterm=italic
hi djangoTagBlock ctermfg=99
hi djangoStatement ctermfg=135 cterm=bold
hi djangoVarBlock ctermfg=57

" Diffs
hi DiffAdd ctermbg=22
hi DiffChange ctermbg=17
hi DiffDelete ctermbg=52
hi DiffText ctermbg=94

" Vim Outliner
" colours for tags
hi outlTags guifg=darkred	ctermfg=darkred
" colours for headings
hi OL1 guifg=white	ctermfg=white
hi OL2 guifg=red	ctermfg=red
hi OL3 guifg=lightblue	ctermfg=lightblue
hi OL4 guifg=violet	ctermfg=magenta
hi OL5 guifg=white	ctermfg=white
hi OL6 guifg=red	ctermfg=red
hi OL7 guifg=lightblue	ctermfg=lightblue
hi OL8 guifg=violet	ctermfg=magenta
hi OL9 guifg=white	ctermfg=white
" colour for body text
hi BT1 guifg=grey	ctermfg=grey
hi BT2 guifg=grey	ctermfg=grey
hi BT3 guifg=grey	ctermfg=grey
hi BT4 guifg=grey	ctermfg=grey
hi BT5 guifg=grey	ctermfg=grey
hi BT6 guifg=grey	ctermfg=grey
hi BT7 guifg=grey	ctermfg=grey
hi BT8 guifg=grey	ctermfg=grey
hi BT9 guifg=grey	ctermfg=grey
" colour for pre-formatted text
hi PT1 guifg=green	ctermfg=green
hi PT2 guifg=green	ctermfg=green
hi PT3 guifg=green	ctermfg=green
hi PT4 guifg=green	ctermfg=green
hi PT5 guifg=green	ctermfg=green
hi PT6 guifg=green	ctermfg=green
hi PT7 guifg=green	ctermfg=green
hi PT8 guifg=green	ctermfg=green
hi PT9 guifg=green	ctermfg=green
" colour for tables
hi TA1 guifg=darkviolet	ctermfg=cyan
hi TA2 guifg=darkviolet	ctermfg=cyan
hi TA3 guifg=darkviolet	ctermfg=cyan
hi TA4 guifg=darkviolet	ctermfg=cyan
hi TA5 guifg=darkviolet	ctermfg=cyan
hi TA6 guifg=darkviolet	ctermfg=cyan
hi TA7 guifg=darkviolet	ctermfg=cyan
hi TA8 guifg=darkviolet	ctermfg=cyan
hi TA9 guifg=darkviolet	ctermfg=cyan
" colour for user text (wrapping)
hi UT1 guifg=darkred	ctermfg=grey
hi UT2 guifg=darkred	ctermfg=grey
hi UT3 guifg=darkred	ctermfg=grey
hi UT4 guifg=darkred	ctermfg=grey
hi UT5 guifg=darkred	ctermfg=grey
hi UT6 guifg=darkred	ctermfg=grey
hi UT7 guifg=darkred	ctermfg=grey
hi UT8 guifg=darkred	ctermfg=grey
hi UT9 guifg=darkred	ctermfg=grey
" colour for user text (non-wrapping)
hi UB1 guifg=darkgray	ctermfg=green
hi UB2 guifg=darkgray	ctermfg=green
hi UB3 guifg=darkgray	ctermfg=green
hi UB4 guifg=darkgray	ctermfg=green
hi UB5 guifg=darkgray	ctermfg=green
hi UB6 guifg=darkgray	ctermfg=green
hi UB7 guifg=darkgray	ctermfg=green
hi UB8 guifg=darkgray	ctermfg=green
hi UB9 guifg=darkgray	ctermfg=green


if has('gui_running')
	hi Normal guifg=gray guibg=black
	hi Cursor guibg=white
	set guifont=Liberation\ Mono\ 9
	set guiheadroom=0
	set go=ac
endif
