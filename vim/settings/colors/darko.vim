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
hi 	LineNr		guifg=#3D3D3D					ctermfg=darkgray
hi	Normal		guifg=#8D8D8D	guibg=#000000	ctermfg=gray 		ctermbg=black
hi  StatusLine	ctermbg=black	ctermfg=gray

if has('gui_running')
	" GUI colours
else
  	" Terminal colours

endif

" vim: sw=2
