.config
========
These are my settings for various programs  
Note that this respects XDG base directory layout; all non-compliant programs' settings are to go in home/  
Currently, bash is the only program which does not comply, as it hooks in the other programs

Installation:

	1. Clone it
	 	git clone http://github.com/woegjiub/.config

	2. Create necessary directories if they don't exist

	3a. If you have root, add to /etc/profile:
			# Source global bash config
			if test "$PS1" && test "$BASH" && test -r /etc/bash.bashrc; then
				. ~/.config/bash/bashrc
			fi

	3b. Otherwise, ln -s ~/.config/bash/bashrc ~/.bash_profile

	4. Configure your graphical terminal to always open login shells

	5. .config/ssh/config needs creation; use .config/ssh/config.example as a basis

	6. Log out and back in again for the environment variables to take effect

	7. Clone Vundle
		git clone http://github.com/gmarik/vundle $XDG_DATA_HOME/vim/bundle/vundle

	8. All vim addons are pulled in through vundle. From vim, run
		:BundleInstall

	9. Some of the addons will require other programs to be installed.
		ack-grep
		exuberant-ctags
		libclang
		node (npm install -g uses $HOME/.local)
			js-beautify
			jsctags
			jshint
			jsonlint
			less
		pip (pip install --user uses $HOME/.local)
			flake8
			pylint
	
	10. Some vim addons require setup
		YouCompleteMe: cd $XDG_DATA_HOME/vim/bundle/YouCompleteMe; ./install.sh
		tern_for_vim: cd $XDG_DATA_HOME/vim/bundle/tern_for_vim; npm install
