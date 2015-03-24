# load the XDG basedirs and aliases
    XDG_CONFIG_HOME="$(dirname ${(%):-%x})/.."
    source "$XDG_CONFIG_HOME/sh/xdg.sh"

# Completion config
    zstyle ':completion:*' completer _expand _complete _ignored _match _correct _approximate _prefix
    zstyle ':completion:*' completions 1
    zstyle ':completion:*' expand prefix suffix
    zstyle ':completion:*' file-sort name
    zstyle ':completion:*' glob 1
    zstyle ':completion:*' ignore-parents parent pwd .. directory
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
    zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
    zstyle ':completion:*' list-suffixes true
    zstyle ':completion:*' match-original both
    zstyle ':completion:*' matcher-list '' '+m:{[:lower:]}={[:upper:]}' '+m:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+r:|[._-]=** r:|=** l:|=*'
    zstyle ':completion:*' max-errors 1
    zstyle ':completion:*' menu select=1
    zstyle ':completion:*' preserve-prefix '//[^/]##/'
    zstyle ':completion:*' prompt 'correcting from %e errors'
    zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
    zstyle ':completion:*' substitute 1
    zstyle ':completion:*' use-compctl false
    zstyle :compinstall filename '$XDG_CONFIG_HOME/zsh/.zshrc'
    autoload -Uz compinit bashcompinit promptinit
    compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"
    bashcompinit

# Set shell options to increase funcitonality
    setopt appendhistory autocd dotglob extendedglob nomatch
    unsetopt beep notify

# VI mode
    bindkey -v
    bindkey '^P' history-beginning-search-backward
    bindkey '^N' history-beginning-search-forward
    bindkey '^w' backward-kill-word
    bindkey '^r' history-incremental-search-backward

# Preferred prompt setting
    function zle-line-init zle-keymap-select {
        if [[ -z $VIRTUAL_ENV ]] then
            venvname=''
        else
            venvname="(${VIRTUAL_ENV##*/}) "
        fi
        PS1="$venvname${${KEYMAP/vicmd/:}/(main|viins)/+} "
        zle reset-prompt
    }
    zle -N zle-line-init
    zle -N zle-keymap-select
    export KEYTIMEOUT=1

# Source common shell config
    source "$XDG_CONFIG_HOME/sh/rc.sh"
