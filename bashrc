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
    if [ -f ~/.bash/aliases ]; then
        . ~/.bash/aliases
    fi
# Sensitive alias definitions.
    if [ -f ~/.bash/saliases ]; then
        . ~/.bash/saliases
    fi

# Scripts folder
    if [ -d ~/.bash/scripts/ ]; then
        for f in ~/.bash/scripts/*; do
            . $f
        done
    fi

# enable programmable completion features
    if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
        . /etc/bash_completion
    fi

# enable autocd
    shopt -s autocd

# vim
    export VISUAL='/usr/bin/vim'
    export EDITOR='/usr/bin/vim'
    alias vi='vim -p'

# tmux in bash by default
    if which tmux 2>&1 >/dev/null; then
        if declare -f tmx > /dev/null; then
            # if no session is started, start a new session
            test -z ${TMUX} && tmx main;
        fi
    fi
