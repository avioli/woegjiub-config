let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
imap <S-Tab> <Plug>SuperTabBackward
inoremap <C-Tab> 	
map! <S-Insert> <MiddleMouse>
map  h
map <NL> j
map  k
map  l
nnoremap # #zz
nnoremap * *zz
map <silent> ,t :call MakeGreen()
nmap ,a :Ack!
map ,g :GundoToggle
map ,n :NERDTreeToggle
nmap ,so :so ~/sessions/
nmap ,ss :wa:mksession! ~/.vim/sessions/
nmap ,sw :mksession! ~/.vim/sessions/default.vim:wa
nmap ,sq :mksession! ~/.vim/sessions/default.vim:wqa
map ,sd :setlocal spell! spelllang=de
map ,se :setlocal spell! spelllang=en
map ,cs :noh
map ,R :browse oldfiles
map 0 ^
nnoremap N Nzz
xmap S <Plug>VSurround
nmap cs <Plug>Csurround
nmap ds <Plug>Dsurround
nmap gx <Plug>NetrwBrowseX
xmap gS <Plug>VgSurround
nnoremap g# g#zz
nnoremap g* g*zz
nnoremap n nzz
nmap ySS <Plug>YSsurround
nmap ySs <Plug>YSsurround
nmap yss <Plug>Yssurround
nmap yS <Plug>YSurround
nmap ys <Plug>Ysurround
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
nnoremap <silent> <Plug>SurroundRepeat .
vmap <silent> <C-Up> :m'<-2`>my`<mzgv`yo`z
vmap <silent> <C-Down> :m'>+`<my`>mzgv`yo`z
nmap <silent> <C-Up> mz:m-2`z
nmap <silent> <C-Down> mz:m+`z
map <S-Insert> <MiddleMouse>
imap S <Plug>ISurround
imap s <Plug>Isurround
imap 	 <Plug>SuperTabForward
imap  <Plug>SuperTabForward
imap  <Plug>SuperTabBackward
imap  <Plug>Isurround
let &cpo=s:cpo_save
unlet s:cpo_save
set autochdir
set autoindent
set autoread
set background=dark
set backspace=eol,start,indent
set completeopt=menuone,longest,preview
set copyindent
set dictionary=/usr/share/dict/words
set fileencodings=ucs-bom,utf-8,default,latin1
set foldlevelstart=9
set formatoptions=cqt
set helplang=en
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set listchars=tab:│\ ,trail:-
set matchtime=2
set mouse=a
set preserveindent
set printoptions=paper:a4
set ruler
set runtimepath=~/.vim/bundle/vundle,~/.vim/bundle/vim-fugitive,~/.vim/bundle/snipmate,~/.vim/bundle/vim-surround,~/.vim/bundle/vim-git,~/.vim/bundle/supertab,~/.vim/bundle/minibufexpl,~/.vim/bundle/ctrlp,~/.vim/bundle/syntastic,~/.vim/bundle/ack.vim,~/.vim/bundle/gundo.vim,~/.vim/bundle/pydoc.vim,~/.vim/bundle/pep8,~/.vim/bundle/pytest.vim,~/.vim/bundle/vim-makegreen,~/.vim/bundle/The-NERD-tree,~/.vim/bundle/rope-vim,~/.vim/bundle/vimoutliner,~/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim73,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after,~/.vim/bundle/settings,~/.vim/bundle/vundle/after,~/.vim/bundle/vim-fugitive/after,~/.vim/bundle/snipmate/after,~/.vim/bundle/vim-surround/after,~/.vim/bundle/vim-git/after,~/.vim/bundle/supertab/after,~/.vim/bundle/minibufexpl/after,~/.vim/bundle/ctrlp/after,~/.vim/bundle/syntastic/after,~/.vim/bundle/ack.vim/after,~/.vim/bundle/gundo.vim/after,~/.vim/bundle/pydoc.vim/after,~/.vim/bundle/pep8/after,~/.vim/bundle/pytest.vim/after,~/.vim/bundle/vim-makegreen/after,~/.vim/bundle/The-NERD-tree/after,~/.vim/bundle/rope-vim/after,~/.vim/bundle/vimoutliner/after
set shiftround
set shiftwidth=4
set showcmd
set showmatch
set smartcase
set smartindent
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c,%V%)\ %P
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set tabstop=4
set textwidth=80
set viminfo=%,'100,<50,s10,h
set wildignore=*.o,*~,~.pyc
set wildmenu
set wildmode=list:longest,full
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/.dotfiles
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +0 ~/.dotfiles/vimrc
args vimrc
edit ~/.dotfiles/vimrc
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
vnoremap <buffer> <silent> [" :exe "normal! gv"|call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")
nnoremap <buffer> <silent> [" :call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")
vnoremap <buffer> <silent> [] m':exe "normal! gv"|call search('^\s*endf*\%[unction]\>', "bW")
nnoremap <buffer> <silent> [] m':call search('^\s*endf*\%[unction]\>', "bW")
vnoremap <buffer> <silent> [[ m':exe "normal! gv"|call search('^\s*fu\%[nction]\>', "bW")
nnoremap <buffer> <silent> [[ m':call search('^\s*fu\%[nction]\>', "bW")
vnoremap <buffer> <silent> ]" :exe "normal! gv"|call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")
nnoremap <buffer> <silent> ]" :call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")
vnoremap <buffer> <silent> ][ m':exe "normal! gv"|call search('^\s*endf*\%[unction]\>', "W")
nnoremap <buffer> <silent> ][ m':call search('^\s*endf*\%[unction]\>', "W")
vnoremap <buffer> <silent> ]] m':exe "normal! gv"|call search('^\s*fu\%[nction]\>', "W")
nnoremap <buffer> <silent> ]] m':call search('^\s*fu\%[nction]\>', "W")
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
set colorcolumn=+1
setlocal colorcolumn=+1
setlocal comments=sO:\"\ -,mO:\"\ \ ,eO:\"\",:\"
setlocal commentstring=\"%s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal copyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'vim'
setlocal filetype=vim
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=9
setlocal foldmarker={{{,}}}
set foldmethod=indent
setlocal foldmethod=indent
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetVimIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,=end,=else,=cat,=fina,=END,0\\
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,#
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
set list
setlocal list
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal preserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal smartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'vim'
setlocal syntax=vim
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=80
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
let s:l = 1 - ((0 * winheight(0) + 34) / 68)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
