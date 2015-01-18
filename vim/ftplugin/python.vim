" Spaces instead of tabs for python
	setlocal et ai ts=4 sts=4 sw=4

" Better syntax highlighting
	let python_highlight_all=1
	set omnifunc=jedi#completions
	setlocal omnifunc=jedi#completions

if has('python3')
py3 << EOF
import os.path
import sys
import vim


sys.path.insert(0, os.getcwd())  # add current dir

# Add the virtualenv's site-packages to vim path
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	sys.path.insert(0, project_base_dir)

# Enable definition-jumping by telling vim where the libs are
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF
else
py << EOF
import os.path
import sys
import vim


sys.path.insert(0, os.getcwd())  # add current dir

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
endif
