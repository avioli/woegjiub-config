.config
========
These are my settings for various programs  
Note that this respects XDG base directory layout; all non-compliant programs' settings are to go in home/

Installation:

	1. Clone it
	 	git clone http://github.com/woegjiub/.config

	2. Symlink settings to ~
		./mklinks.sh

	3. Clone Vundle
		git clone http://github.com/gmarik/vundle $XDG_DATA_HOME/vim/bundle/vundle

	4. All vim addons are pulled in through vundle. From vim, run
		:BundleInstall

	5. Some of the addons will require other programs to be installed.
		ack-grep
		libclang
		exuberant-ctags
		flake8
		node-less
	
	5. Some vim addons require setup
		YouCompleteMe
