# Environment-variable respecting programs
    export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
    export GSTREGISTRY="$XDG_DATA_HOME/gstreamer/registry.bin"
    export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
    export HISTFILE="$XDG_CACHE_HOME/bash/history"
    export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
    export KDEHOME="$XDG_CONFIG_HOME/kde"
    export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
    export npm_config_userconfig="$XDG_CONFIG_HOME/npm/npmrc"
    export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
    export PENTADACTYL_INIT=":source $XDG_CONFIG_HOME/pentadactyl/pentadactylrc"
    export PIP_CONFIG_FILE="$XDG_CONFIG_HOME/pip/config"
    export PIP_DOWNLOAD_CACHE="$XDG_CACHE_HOME/pip/download"
    export PIP_LOG_FILE="$XDG_CACHE_HOME/pip/log"
    export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
    export RXVT_SOCKET="$XDG_CACHE_HOME/urxvt/urxvtd.sock"
    export VIMINIT="source $XDG_CONFIG_HOME/vim/vimrc"
    export XAUTHORITY="$XDG_CACHE_HOME/X11/Xauthority"

# Alias respecting programs
    alias firefox="firefox -profile $XDG_CONFIG_HOME/firefox"
    alias mutt="mutt -F $XDG_CONFIG_HOME/mutt/muttrc"
    alias ssh="ssh -F $XDG_CONFIG_HOME/ssh/config"
    alias startx="startx $XDG_CONFIG_HOME/X11/xinitrc"
    alias tmux="tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf"
