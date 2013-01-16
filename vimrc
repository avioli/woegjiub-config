" Add My Settings Folder
	set rtp+=~/.vim/settings

" General settings
	set ffs=unix						" Unix as standard filetype
	set encoding=utf-8					" UTF-8 as standard encoding
	set nocompatible					" Enable vimness
	set autoread						" Automatically detect outside changes
	set history=1000					" Massive history
	" Adds the dictionary for C_x,C_k
	set dictionary+=/usr/share/dict/words
	" Set autocompletion options
	set completeopt=menuone,longest,preview
	set exrc							" Per-directory vimrcs
	set secure							" Disable insecure local vimrc commands
	set modeline						" Vim settings in files

" UI Settings
	set showcmd							" Shows Current Command
	set number							" Line Numbers
	set ruler							" Show position at bottom
	set lazyredraw						" Do not redraw whilst executing macros
	set noerrorbells novisualbell		" Shut the warnings up
	syntax on							" Enable syntax highlighting
	set showmatch						" Highlight matching brackets
	set mat=2							" Blink that highlight at 0.2s
	set wildmenu						" Good menu tab completion
	set wildmode=list:longest,full		" Set menu completion style
	set wildignore=*.o,*~,~.pyc			" Ignore compiled files
	set viminfo^=%						" Remember buffer info on close
	au BufReadPost * 					" Go to last position on file open
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\ 	exe "normal! g`\"" |
	\ endif
	set laststatus=2					" Always show statusline
	" file, helpfile, modified, readonly, split,  cursor location, V%
	set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c,%V%)\ %P
	colo darko							" Load my colourscheme

" Input/Hotkey settings
	set mouse=a							" Enable Mouse
	set backspace=eol,start,indent		" Proper backspace behaviour
	let mapleader = ","					" Leader enables some cool combos
	let g:clipbrdDefaultReg="+"			" Use Linux clipboard as def copy reg
	" Make shift-insert work as linux paste
	map <S-Insert> <MiddleMouse>
	map! <S-Insert> <MiddleMouse>
	" Recall recent file list
	map <leader>R :browse oldfiles<CR>
	" Move lines around with C_↑ or C_↓
	nmap <silent> <C-down> mz:m+<CR>`z
	nmap <silent> <C-up> mz:m-2<CR>`z
	vmap <silent> <C-down> :m'>+<CR>`<my`>mzgv`yo`z
	vmap <silent> <C-up> :m'<-2<CR>`>my`<mzgv`yo`z
	" Move splits around with C_h/j/k/l
	map <c-l> <c-w>l
	map <c-h> <c-w>h
	map <c-k> <c-w>k
	map <c-j> <c-w>j
	" Map hard BOL to soft BOL
	map 0 ^
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
	" Save+Quit
	nmap <leader>sq <ESC>:mksession! ~/.vim/sessions/default.vim<cr>:wqa<cr>
	" Save
	nmap <leader>sw <ESC>:mksession! ~/.vim/sessions/default.vim<cr>:wa<cr>
	" Restore
	function! RestoreSession()
		if argc() == 0 	" vim called sans arguments
			execute 'source ~/.vim/sessions/default.vim'
		end
	endfunction
	autocmd VimEnter * call RestoreSession()
	" Save As
	nmap <leader>ss :wa<cr>:mksession! ~/.vim/sessions/
	" Restore As (Open)
	nmap <leader>so :so ~/sessions/

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

" Addon Settings
	" Set up Vundle to do its magic
		filetype off
		set rtp+=~/.vim/bundle/vundle
		call vundle#rc()
		Bundle 'gmarik/vundle'
	" Bundle and Configure Addons ($lang conf in 'settings/ftplugin/$lang.vim')
		" Documentation
			" Python
				Bundle 'fs111/pydoc.vim'
		" Git
			Bundle 'tpope/vim-fugitive'
			Bundle 'tpope/vim-git'
		" Interface/Navigation addons
			" Note Taking
			Bundle 'vimoutliner/vimoutliner'
			" Project Tree
			Bundle 'vim-scripts/The-NERD-tree'
			map <Leader>n :NERDTreeToggle<CR>
			" Revision History
			Bundle 'sjl/gundo.vim'
			map <leader>g :GundoToggle<CR>
			" Tasklist
			Bundle 'vim-scripts/TaskList.vim'
			map <leader>tl <Plug>Tasklist
		" Search Addons
			" Enable Ack Searching
			Bundle 'mileszs/ack.vim'
			nmap <leader>a <Esc>:Ack!
			" Search Buffers/Filenames+Paths for navigation
			Bundle 'kien/ctrlp.vim'
		" Syntax Testing
			Bundle 'scrooloose/syntastic'
			" Python
			Bundle 'vim-scripts/pep8'
			Bundle 'alfredodeza/pytest.vim'
		" Typing Efficiency Improvers
			" Add Snippet Support
			Bundle 'msanders/snipmate.vim'
			" Tab-Based OmniComplete with SuperTab
			Bundle 'ervandew/supertab'
			let g:SuperTabDefaultCompletionType = "context"
			" Change the Surroundings of Text
			Bundle 'tpope/vim-surround'

" Indentation Settings
	set shiftround						" Indents rounded to shiftwidths
	set copyindent						" Maintain current indent on next line
	set preserveindent					" Try not to mess with indentation
	set autoindent						" Enables autoindent
	set smartindent						" Enables smartindent
	set shiftwidth=4					" Tabs at 4 width
	set tabstop=4						" Tabs at 4 width
	set textwidth=79					" Line wrap at 80 characters
	set colorcolumn=+1					" Colours the column following that
	set fo+=t							" Enables autowrap
	set wrap							" Enables line wrapping for long lines
	filetype on							" Enable filetype-specific settings
	filetype plugin indent on			" Enable filetype-specific indentation
	set list							" Show whitespace
	set listchars=tab:│\ ,trail:-		" Show these whitespaces by default

" Folding settings
	set foldmethod=indent				" Enable Folding
	set foldlevelstart=99				" Start at fold level 99
	" Save fold settings
	au BufWinLeave *.* mkview!
	au BufWinEnter *.* silent loadview

" Search settings
	set ignorecase						" Ignores cases in searching
	set smartcase						" Smart case matching
	set hlsearch						" Highlight search results
	set incsearch						" Search incrementally
