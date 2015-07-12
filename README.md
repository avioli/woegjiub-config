.config
========
These are my settings for various programs
Note that this respects XDG base directory layout
Currently, bash/zsh are the only programs which do not comply, as they hook in the other programs
By editing /etc/profile (for bash) or /etc/zshenv (for zsh), a dotfile-free $HOME is achieved

Installation:

	1. Clone it
	 	git clone http://github.com/woegjiub/.config

	2. Your device:
			Bash: sudo echo '[[ ! -z "$PS1" ]] && [[ ! -z "$BASH_VERSION" ]] && . ~/.config/bash/bashrc' >> /etc/profile
			Zsh: sudo echo 'export ZDOTDIR="$HOME/.config/zsh"' >> /etc/zshenv
		Remote host:
			Bash: `ln -s ~/.config/bash/bashrc ~/.bash_profile`
			Zsh: ensure "SendEnv ZDOTDIR" is in your ssh config

	3. Configure your graphical terminal to always open login shells

	4. Log out and back in again for the environment variables to take effect

	5. `cd ~/.config && ./bootstrap.sh`

	6. Some of the addons will require other programs to be installed.
		silver-searcher
		npm (npm install -g uses $HOME/.local)
			js-beautify
			jsctags
			jshint
			jsonlint
			less
		pip (pip install --user uses $HOME/.local)
			flake8
			pylint
