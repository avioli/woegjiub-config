# If not running interactively, don't do anything
    [ -z "$PS1" ] && return

#Source global bashrc if required
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Preferred Prompt Setting
PS1="\u@\h:\w\\$ "

# History
    HISTCONTROL=ignoreboth # ignore duplicate/blank lines in history
    shopt -s histappend # append to history, don't overwrite
    HISTSIZE=1000
    HISTFILESIZE=2000
    HISTFILE=~/.bash/history

# UI
    shopt -s checkwinsize # adjust lines/cols to window size after commands if need
    # enable more colours
    if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        alias ls='ls -hF --color=auto'
        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
        man() {
            env LESS_TERMCAP_mb=$(printf "\e[1;31m") \
                LESS_TERMCAP_md=$(printf "\e[1;31m") \
                LESS_TERMCAP_me=$(printf "\e[0m") \
                LESS_TERMCAP_se=$(printf "\e[0m") \
                LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
                LESS_TERMCAP_ue=$(printf "\e[0m") \
                LESS_TERMCAP_us=$(printf "\e[1;32m") \
                man "$@"
        }
    fi

# Alias definitions.
    if [ -f ~/.bash/aliases ]; then
        . ~/.bash/aliases
    fi
# Sensitive alias definitions.
    if [ -f ~/.bash/saliases ]; then
        . ~/.bash/saliases
    fi

# Scripts folder
    if [ -d ~/.bash/scripts/ ]; then
        export PATH="~/.bash/scripts/:${PATH}"
    fi

# enable programmable completion features
    if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
        . /etc/bash_completion
    fi
# otherwise, look for a locally-installed copy
    if [ -f ~/share/bash-completion/bash_completion ]; then
        . ~/share/bash-completion/bash_completion
    fi

# Locally installed executables
    if [ -d ~/bin ]; then
        export PATH="$HOME/bin:$PATH"
    fi

# Local install of NPM
    if [ -d ~/lib/node_modules ]; then
        export NODE_PATH="$HOME/lib/node_modules:$NODE_PATH"
    fi

# Virtualenv path
    if [ -d ~/.virtualenvs ]; then
        export WORKON_HOME=$HOME/.virtualenvs
    fi
    if [ -f /home/woegjiub/bin/virtualenvwrapper.sh ]; then
        export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.7
        source /home/woegjiub/bin/virtualenvwrapper.sh
    fi

# enable autocd
    shopt -s autocd

# vim by default
    export VISUAL='/usr/bin/vim'
    export EDITOR='/usr/bin/vim'
    alias vi='vim -p'

# Stop complaints avout rxvt-unicode on not-completely supported environments
    case "$TERM" in
        rxvt-unicode-256color)
            TERM=rxvt-unicode
            ;;
    esac

# tmux in bash by default
    if which tmux 2>/dev/null >/dev/null; then
        # if no session is started, start a new session
        test -z ${TMUX} && tmx main;
    fi
