# Environment-variable respecting programs
	export GEM_HOME="$HOME/.local/lib/gems"
	export GEM_PATH="$HOME/.local/bin"
	export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
	export GIT_SSH="$XDG_CONFIG_HOME/git/git_ssh.sh"
	export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
	# Note: gstreamer registry is usually per-arch.
	# Any secondary architecture applications should have this exported to a
	# different value before launch
	# Thankfully, this is only needed for gstreamer0.10; 1.0 has a sane default
	export GST_REGISTRY="$XDG_CACHE_HOME/gstreamer/registry-$(lscpu | awk 'NR==1{print $2}').bin"
	export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
	export HISTFILE="$XDG_DATA_HOME/bash/history"
	export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
	export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
	export KDEHOME="$XDG_CONFIG_HOME/kde"
	export LESSHISTFILE="$XDG_DATA_HOME/less/history"
	export MYSQL_HISTFILE="$XDG_DATA_HOME/mysql/history"
	export npm_config_userconfig="$XDG_CONFIG_HOME/npm/npmrc"
	export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
	export PENTADACTYL_INIT=":source $XDG_CONFIG_HOME/pentadactyl/pentadactylrc"
	export PIP_CONFIG_FILE="$XDG_CONFIG_HOME/pip/pip.conf"
	export PIP_LOG_FILE="$XDG_DATA_HOME/pip/log"
	export PSQLRC="$XDG_CONFIG_HOME/psql/psqlrc"
	export PSQL_HISTORY="$XDG_DATA_HOME/psql/history"
	export PYLINTHOME="$XDG_DATA_HOME/pylint"
	export PYLINTRC="$XDG_CONFIG_HOME/pylint/pylintrc"
	export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
	export RXVT_SOCKET="$XDG_RUNTIME_DIR/urxvtd.sock"
	export TERMINFO="$XDG_CONFIG_HOME/terminfo"
	export VAGRANT_HOME="$XDG_DATA_HOME/vagrant"
	export VIMINIT="source $XDG_CONFIG_HOME/vim/vimrc"
	export VIMPERATOR_INIT=":source $XDG_CONFIG_HOME/vimperator/vimperatorrc"
	export VIMPERATOR_RUNTIME="$XDG_CONFIG_HOME/vimperator"
	export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
	export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Alias respecting programs
	alias ag="ag -p $XDG_CONFIG_HOME/ag/agignore"
	alias firefox="firefox -profile $XDG_CONFIG_HOME/firefox"
	export BROWSER="firefox -profile $XDG_CONFIG_HOME/firefox"
	alias mutt="mutt -F $XDG_CONFIG_HOME/mutt/muttrc"
	alias ncmpcpp="ncmpcpp -c $XDG_CONFIG_HOME/ncmpcpp/config"
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
