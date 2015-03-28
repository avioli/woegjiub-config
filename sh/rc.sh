# Requires the sourcing of xdg.sh prior to running

 # If not running interactively, don't do anything
    [ -z "$PS1" ] && return

# Get rid of the terminal suspend/resume bindings
    stty stop undef
    stty start undef

# Terminal-agnostic settings
    export LANG='en_AU.UTF-8'     # Proper locale
    export LC_COLLATE='C'         # Change sorting to list dotfiles first
    export LC_TIME='en_DK.UTF-8'  # ISO 8601 datetimes
    export EDITOR='vim'           # Use vim for light edits
    export VISUAL='vim'           # Use vim for heavy edits
    export HISTCONTROL=ignoreboth # Ignore duplicate/blank lines in history
    export HISTSIZE=100000        # 100K command in history file
    SAVEHIST=100000               # 100K history in shell

# Colour the terminal
    [ -x /usr/bin/dircolors ] && eval "$(dircolors -b $XDG_CONFIG_HOME/sh/dircolors)"
    export LESS=-R
    export LESS_TERMCAP_mb=$(printf "\e[1;31m")
    export LESS_TERMCAP_md=$(printf "\e[1;31m")
    export LESS_TERMCAP_me=$(printf "\e[0m")
    export LESS_TERMCAP_se=$(printf "\e[0m")
    export LESS_TERMCAP_so=$(printf "\e[1;44;33m")
    export LESS_TERMCAP_ue=$(printf "\e[0m")
    export LESS_TERMCAP_us=$(printf "\e[1;32m")

# Load Aliases and Functions
    [ -d $XDG_CONFIG_HOME/sh/functions/ ] &&
        for f in $XDG_CONFIG_HOME/sh/functions/*; do . $f; done
    [ -f "$XDG_CONFIG_HOME"/sh/aliases.sh ] && .  $XDG_CONFIG_HOME/sh/aliases.sh
    [ -f "$XDG_CONFIG_HOME"/sh/saliases.sh ] && .  $XDG_CONFIG_HOME/sh/saliases.sh
    clean_home

# Append Additional Executables to $PATH
    [ -d /usr/local/opt/coreutils ] &&
        export PATH="/usr/local/opt/coreutils/libexec/gnubin:${PATH}" &&
        export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
    export PATH="$HOME/.local/bin:${PATH}"
    export NODE_PATH="$HOME/.local/lib/node_modules"

# Ensure GPG Agent is running if it can
    [ -z $GPG_AGENT_INFO ] && command_exists gpg-agent &&
        eval $(gpg-agent --daemon --enable-ssh-support --write-env-file="$GNUPGHOME/gpg-agent-info" 2>/dev/null) &&
        export SSH_AUTH_SOCK

# Start X if we're at seat1 and it's not there, else open tmux
    if [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]]; then
        startx
    else
        tmx default
    fi
