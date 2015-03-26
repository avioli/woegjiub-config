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
    autoload -U colors && colors
    setopt appendhistory autocd dotglob extendedglob nomatch
    unsetopt beep notify

# VI mode
    bindkey -v
    bindkey '^P' history-beginning-search-backward
    bindkey '^N' history-beginning-search-forward
    bindkey '^w' backward-kill-word
    bindkey '^r' history-incremental-search-backward
    bindkey '\e[1~' beginning-of-line
    bindkey '\e[4~' end-of-line
    bindkey '\e[5~' beginning-of-history
    bindkey '\e[6~' end-of-history
    bindkey '\e[7~' beginning-of-line
    bindkey '\e[5C' forward-word
    bindkey '\e[5D' backward-word
    bindkey '\e\e[C' forward-word
    bindkey '\e\e[D' backward-word
    bindkey '\e[1;5C' forward-word
    bindkey '\e[1;5D' backward-word
    bindkey '^a' beginning-of-line
    bindkey '^e' end-of-line
    bindkey '\M-B' backward-word
    bindkey '\M-F' forward-word
    bindkey '^k' kill-line

# Preferred prompt setting - virtualenv if active, vim mode, # jobs if > 0
    function zle-line-init zle-keymap-select {
        if [[ -z $VIRTUAL_ENV ]] then
            venvname=''
        else
            venvname="(${VIRTUAL_ENV##*/}) "
        fi
        PROMPT="$venvname${${KEYMAP/vicmd/:}/(main|viins)/+} %F{blue}%1(j.%j .)%f"
        zle reset-prompt
    }
    zle -N zle-line-init
    zle -N zle-keymap-select
    export KEYTIMEOUT=1

# Source common shell config
    source "$XDG_CONFIG_HOME/sh/rc.sh"
