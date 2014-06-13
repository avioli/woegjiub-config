" Spaces instead of tabs for python
	setlocal et ai ts=4 softtabstop=4 sw=4

" Enable autocompletion
	set omnifunc=pythoncomplete#Complete

" Better syntax highlighting
	let python_highlight_all=1

" Addon-dependant Python Mappings
	" Enable RopeVim GoTo Definition and Code Refactoring
	map <leader>j :RopeGotoDefinition<CR>
	map <leader>r :RopeRename<CR>

	" Enable Testing with PyTest
		" Execute the Tests
		nmap <silent><leader>tf <Esc>:Pytest file<CR>
		nmap <silent><leader>tc <Esc>:Pytest class<CR>
		nmap <silent><leader>tm <Esc>:Pytest method<CR>
		" Cycle Through Errors
		nmap <silent><leader>tn <Esc>:Pytest next<CR>
		nmap <silent><leader>tp <Esc>:Pytest previous<CR>
		nmap <silent><leader>te <Esc>:Pytest error<CR>

py << EOF
import os.path
import sys
import vim

# Add the virtualenv's site-packages to vim path
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	sys.path.insert(0, project_base_dir)
	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	execfile(activate_this, dict(__file__=activate_this))

# Enable definition-jumping by telling vim where the libs are
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF
