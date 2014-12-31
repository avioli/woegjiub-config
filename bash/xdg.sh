# Environment-variable respecting programs
	export GIT_SSH="$XDG_CONFIG_HOME/git/git_ssh.sh"
	export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
	export GSTREGISTRY="$XDG_DATA_HOME/gstreamer/registry.bin"
	export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
	export HISTFILE="$XDG_DATA_HOME/bash/history"
	export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
	export KDEHOME="$XDG_CONFIG_HOME/kde"
	export LESSHISTFILE="$XDG_DATA_HOME/less/history"
	export npm_config_userconfig="$XDG_CONFIG_HOME/npm/npmrc"
	export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
	export PENTADACTYL_INIT=":source $XDG_CONFIG_HOME/pentadactyl/pentadactylrc"
	export PIP_CONFIG_FILE="$XDG_CONFIG_HOME/pip/config"
	export PIP_DOWNLOAD_CACHE="$XDG_CACHE_HOME/pip/download"
	export PIP_LOG_FILE="$XDG_DATA_HOME/pip/log"
	export PYLINTHOME="$XDG_DATA_HOME/pylint"
	export PYLINTRC="$XDG_CONFIG_HOME/pylint/pylintrc"
	export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
	export RXVT_SOCKET="$XDG_RUNTIME_DIR/urxvtd.sock"
	export TERMINFO="$XDG_CONFIG_HOME/terminfo"
	export VIMINIT="source $XDG_CONFIG_HOME/vim/vimrc"
	export VIMPERATOR_INIT=":source $XDG_CONFIG_HOME/vimperator/vimperatorrc"
	export VIMPERATOR_RUNTIME="$XDG_CONFIG_HOME/vimperator"
	export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
	export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Alias respecting programs
	alias firefox="firefox -profile $XDG_CONFIG_HOME/firefox"
	export BROWSER="firefox -profile $XDG_CONFIG_HOME/firefox"
	alias mutt="mutt -F $XDG_CONFIG_HOME/mutt/muttrc"
	alias scp="scp -F $XDG_CONFIG_HOME/ssh/config"
	alias ssh="ssh -F $XDG_CONFIG_HOME/ssh/config"
	alias startx="startx $XDG_CONFIG_HOME/X11/xinitrc"
	alias rtorrent="rtorrent -n -o import=$XDG_CONFIG_HOME/rtorrent/conf"
	alias tmux="tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf"

# Disgusting hacks
	function sl3(){
		mv {$XDG_DATA_HOME/sqlite3/,~/.}sqlite_history
		sqlite3 "$@"
		mv {~/.,$XDG_DATA_HOME/sqlite3/}sqlite_history
	}
