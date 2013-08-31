dotfiles
========
These are my settings for various programs

Installation:

	1. Clone them (include submodules else vundle won't come in)

	2. Symlink settings to ~
		./mklinks.sh

	3. All vim addons are pulled in through vundle. From vim, run
		:Bundle Install

	4. Some of the addons will require other programs to be installed.
		ack-grep
		libclang
		exuberant-ctags
		flake8
		node-less
	
	5. Some vim addons require setup
		YouCompleteMe
