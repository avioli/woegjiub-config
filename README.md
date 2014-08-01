.config
========
These are my settings for various programs  
Note that this respects XDG base directory layout; all non-compliant programs' settings are to go in home/
Currently, bash is the only program which does not comply, as it hooks in the other programs

Installation:

	1. Clone it
	 	git clone http://github.com/woegjiub/.config

	2. Symlink settings to ~
		./mklinks.sh

	3. .config/ssh/config needs creation; use .config/ssh/config.example as a basis

	4. Clone Vundle
		git clone http://github.com/gmarik/vundle $XDG_DATA_HOME/vim/bundle/vundle

	5. All vim addons are pulled in through vundle. From vim, run
		:BundleInstall

	6. Some of the addons will require other programs to be installed.
		ack-grep
		libclang
		exuberant-ctags
		flake8
		pylint
		node-less
	
	6. Some vim addons require setup
		YouCompleteMe - move to $XDG_DATA_HOME, run the installer
