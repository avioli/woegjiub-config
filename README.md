.config
========
These are my settings for various programs
Note that this respects XDG base directory layout
All non-compliant programs' settings are to go in home/

Installation:

	1. Clone them (include submodules else vundle won't come in)

	2. Symlink settings to ~
		./mklinks.sh

	3. Clone Vundle
		git clone http://github.com/gmarik/vundle $XDG_DATA_HOME/vim/bundle/vundle

	4. All vim addons are pulled in through vundle. From vim, run
		:BundleInstall

	5. Some of the addons will require other programs to be installed.
		ack-grep
		exuberant-ctags
		flake8
		node-less
