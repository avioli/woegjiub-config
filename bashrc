# If not running interactively, don't do anything
    [ -z "$PS1" ] && return

# History
    HISTCONTROL=ignoreboth # ignore duplicate/blank lines in history
    shopt -s histappend # append to history, don't overwrite
    HISTSIZE=1000
    HISTFILESIZE=2000

# UI
    shopt -s checkwinsize # adjust lines/cols to window size after commands if need
    # enable color support of ls/grep
    if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        alias ls='ls -hF --color=auto'
        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
    fi

# Alias definitions.
    if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
    fi

# enable programmable completion features
    if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
        . /etc/bash_completion
    fi

# vim
    export VISUAL='/usr/bin/vim'
    export EDITOR='/usr/bin/vim'
    alias vi='vim -p'
