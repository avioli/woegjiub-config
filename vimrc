" Add My Settings Folder
	set rtp+=~/.vim/settings

" Addon Settings
	" Set up Vundle to do its magic
		filetype off
		let mapleader = ","
		set rtp+=~/.vim/bundle/vundle
		call vundle#rc()
		Bundle 'gmarik/vundle'
	" Bundle and Configure Addons ($lang conf in 'settings/ftplugin/$lang.vim')
		" Documentation
			" Python
				Bundle 'fs111/pydoc.vim'
		" Git
			Bundle 'gregsexton/gitv'
			Bundle 'tpope/vim-fugitive'
			Bundle 'tpope/vim-git'
			:command Gpush Git push origin master
		" Interface/Navigation addons
			" Note Taking
				Bundle 'vimoutliner/vimoutliner'
					" Mappings to change code to and from outlines
					map <leader>oc :s/^/<\ /<cr>:noh<cr>
					map <leader>oC :s/^	*<\ \=//<cr>:noh<cr>
					" Mapping to create paragraphs from visual blocks of
					" HTML paragraphs pasted over
					map <leader>op :s/^\(\t*:\)\(.\+\)/\1____\2/<cr>gvgqgv:s/____/\ \ \ \ /g<cr>gv:s/^\t*:\s*\n//<cr>:noh<cr>
					" Mapping to wrap citations
					map <leader>oq :s/^\(\t*\:\)\(\d\+\)/\1\ \ \ \ \2/<cr>gvgqgv:s/^\(\t*:\)\ \ \ \ \(\d\+\.*\ \)/\1\2/<cr>gv:s/^\(\t*\):/\1</<cr>gv:s/^\t*<\s*\n//<cr>:noh<cr>
					" Mapping to swap from wrapping to static text in V-block
					map <leader>os :s/^\(\t*\):/\1</<cr>:noh<cr>
			" Project Tree
				Bundle 'The-NERD-tree'
					map <Leader>n :NERDTreeToggle<CR>
					let g:NERDTreeQuitOnOpen=1
				Bundle 'majutsushi/tagbar'
					map <leader>m :TagbarToggle<CR>
					let g:tagbar_autoclose=1
					let g:tagbar_left=1
					let g:tagbar_compact=1
			" Revision History
				Bundle 'sjl/gundo.vim'
					map <leader>g :GundoToggle<CR>
			" Tasklist
				Bundle 'TaskList.vim'
		" Search Addons
			" Enable Ack Searching
				Bundle 'mileszs/ack.vim'
					nmap <leader>a <Esc>:Ack! 
			" Search Buffers/Filenames+Paths for navigation
				Bundle 'kien/ctrlp.vim'
		" Syntax Highlighting
			" CSS3
				Bundle 'hail2u/vim-css3-syntax'
				Bundle 'ap/vim-css-color'
			" HTML5
				Bundle 'othree/html5.vim'
			" LESS
				Bundle 'groenewege/vim-less'
			" Prolog
				Bundle 'adimit/prolog.vim'
		" Syntax Testing
			Bundle 'scrooloose/syntastic'
				let g:syntastic_auto_loc_list=1
				let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
				map <F5> :SyntasticCheck<cr>
			" Python
				Bundle 'alfredodeza/pytest.vim'
				Bundle 'fs111/pydoc.vim'
		" Typing Efficiency Improvers
			" Add Snippet Support
				Bundle 'SirVer/ultisnips'
					let g:UltiSnipsSnippetsDir='~/.vim/settings/snippets'
					let g:UltiSnipsEditSplit='vertical'
					map <leader>es :UltiSnipsEdit<cr>
					let g:UltiSnipsSnippetsDirectories=['UltiSnips', 'snippets']
					let g:UltiSnipsJumpForwardTrigger = "<tab>"
					let g:UltiSnipsJumpBackwardTrigger = "<c-tab>"
			" Zen-coding
				Bundle 'tristen/vim-sparkup'
			" Change the Surroundings of Text
				Bundle 'tpope/vim-surround'
			" Adds some nice shortcuts
				Bundle 'tpope/vim-unimpaired'

" General settings
	set ffs=unix							" Unix as standard filetype
	set encoding=utf-8						" UTF-8 as standard encoding
	set nocompatible						" Enable vimness
	set autoread							" Automatically detect outside changes
	set history=1000						" Massive history
	set dictionary+=/usr/share/dict/words	" Adds the dictionary for C_x,C_k
	set completeopt=menuone,longest,preview	" Set autocompletion options
	set exrc								" Per-directory vimrcs
	set secure								" Disable insecure local vimrc commands
	set modeline							" Vim settings in files
	set noswapfile							" Stop littering these things
	set viminfo+=n~/.vim/history			" Less things in home

" UI Settings
	set showcmd								" Shows Current Command
	set showfulltag							" Increase info for tag completion
	set number								" Line Numbers
	set ruler								" Show position at bottom
	set lazyredraw							" Do not redraw whilst executing macros
	set noerrorbells novisualbell			" Shut the warnings up
	syntax on								" Enable syntax highlighting
	set showmatch							" Highlight matching brackets
	set mat=2								" Blink that highlight at 0.2s
	set wildmenu							" Good menu tab completion
	set wildmode=list:longest,full			" Set menu completion style
	set wildignore=*.o,*~,~.pyc				" Ignore compiled files
	au BufReadPost * 						" Go to last position on file open
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\ 	exe "normal! g`\"" |
	\ endif
	set laststatus=2						" Always show statusline
	" file, helpfile, modified, readonly, split,  cursor location, V%
	set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%{SyntasticStatuslineFlag()}%=%-14.(%l,%c,%V%)\ %P
	set t_Co=256							" 256 Colours in Terminal
	colo darko								" Load my colourscheme

" Input/Hotkey settings
	set mouse=a								" Enable Mouse
	set backspace=eol,start,indent			" Proper backspace behaviour
	" tabbing
		map <leader>tn :tabnew 
	let g:clipbrdDefaultReg=	"+"			" Use Linux clipboard as def copy reg
	" Added XOR to digraphs
	digraph XO 8853
	" easy buffer navigation
		map <leader>b :buffers<CR>:buffer 
	" Make shift-insert work as linux paste
		map <S-Insert> <MiddleMouse>
		map! <S-Insert> <MiddleMouse>
	" Recall recent file list
		map <leader>r :browse oldfiles<CR>
	" Fix control-arrows in tmux
	if &term =~ '^screen'
		execute "set <xUp>=\e[1;*A"
		execute "set <xDown>=\e[1;*B"
		execute "set <xRight>=\e[1;*C"
		execute "set <xLeft>=\e[1;*D"
	endif
	" Move lines around with C_↓ or C_↑
		nmap <silent> <c-down> mz:m+<CR>`z
		nmap <silent> <c-up> mz:m-2<CR>`z
		vmap <silent> <c-down> :m'>+<CR>`<my`>mzgv`yo`z
		vmap <silent> <c-up> :m'<-2<CR>`>my`<mzgv`yo`z
	" Move splits around with C_h/j/k/l
		map <c-l> <c-w>l
		map <c-h> <c-w>h
		map <c-k> <c-w>k
		map <c-j> <c-w>j
	" Map hard BOL to soft BOL
		map 0 ^
	" Swap braces to/from being on their own line (c-like languages)
		function! MoveBraces(brace)
			let searchString = '\n\s*'.a:brace
			if search(searchString)
				exec '%s/'.searchString.'/'.a:brace.'/g'
			else
				if a:brace ==# "}"
					exec 'g!/[^;]}\+;/s/}/\r}/g'
				elseif a:brace ==# "{"
					exec '%s/{$/\r{/g'
				endif
				normal gg=G
			endif
		endfunction
		map <leader>{ :call MoveBraces("{")<CR>
		map <leader>} :call MoveBraces("}")<CR>
	" Clear search results
		map <leader>cs :noh<cr>
	" Centers Search results
		nnoremap n nzz
		nnoremap N Nzz
		nnoremap * *zz
		nnoremap # #zz
		nnoremap g* g*zz
		nnoremap g# g#zz
	" Show word's syntax group with C_S_p
		nmap <C-S-P> :call <SID>SynStack()<CR>
		function! <SID>SynStack()
			if !exists("*synstack")
				return
			endif
			echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
		endfunc
	" Change dictionary language (Ger/Eng)
		map <leader>se :setlocal spell! spelllang=en<cr>
		map <leader>sd :setlocal spell! spelllang=de<cr>

" Session Management
	" Save
		func! <SID>Savesession()
			if v:this_session == ""
				let cmd = "mksession! ~/.vim/sessions/default.vim"
			else
				let cmd = "mksession! ".v:this_session
			endif
			echo cmd
			exec cmd
		endfunc
		nmap <leader>sw <ESC>:call <SID>Savesession()<cr>:wa<cr>
	" Save+Quit
		nmap <leader>sq <ESC>:call <SID>Savesession()<cr>:wqa<cr>
	" Restore
		function! RestoreSession()
			if argc() == 0 	" vim called sans arguments
				execute 'source ~/.vim/sessions/default.vim'
			endif
		endfunction
		autocmd VimEnter * call RestoreSession()
	" Save As
		nmap <leader>sa :wa<cr>:mksession! ~/.vim/sessions/
	" Restore As (Open)
		nmap <leader>so :so ~/.vim/sessions/

" Saving Improvements
	" Auto MkDir for saves in non-existant dirs
		function! s:CheckDirectoryExists()
			if expand("<afile>")!~#'^\w\+:/' && !isdirectory(expand("%:h"))
				call system(printf("mkdir -p %s", shellescape(expand('%:h'), 1)))
				redraw!
			endif
		endfunction
		augroup BWCCreateDir
			au!
			autocmd BufWritePre * call s:CheckDirectoryExists()
		augroup END

" Indentation Settings
	set shiftround							" Indents rounded to shiftwidths
	set copyindent							" Maintain current indent on next line
	set preserveindent						" Try not to mess with indentation
	set autoindent							" Enables autoindent
	set smartindent							" Enables smartindent
	set shiftwidth=4						" Indentation at 4 width
	set tabstop=4							" Tabs at 4 width
	set softtabstop=4						" Soft tabs at 4 width
	set textwidth=79						" Line wrap at 80 characters
	if v:version >= 703
		set colorcolumn=+1					" Colours the column following that
	endif
	set fo+=t								" Enables autowrap
	set wrap								" Enables line wrapping for long lines
	filetype on								" Enable filetype-specific settings
	filetype plugin indent on				" Enable filetype-specific indentation
	set list								" Show whitespace
	set listchars=tab:│\ ,trail:-			" Show these whitespaces by default

" Folding settings
	set foldmethod=indent					" Enable Folding
	set foldlevelstart=99					" Start at fold level 99
	" Save fold settings
		au BufWinLeave *.* mkview!
		au BufWinEnter *.* silent loadview

" Search settings
	set ignorecase							" Ignores cases in searching
	set smartcase							" Smart case matching
	set hlsearch							" Highlight search results
	set incsearch							" Search incrementally
	" Default to very magic seraching
	nnoremap / /\v
	vnoremap / /\v
