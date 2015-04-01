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
