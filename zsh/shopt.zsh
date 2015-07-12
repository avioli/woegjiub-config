# Colourise
autoload -U colors && colors
# Navigation settings
setopt autocd autopushd cdablevars pushdignoredups pushdminus pushdsilent pushdtohome
# History settings
setopt histignoredups histignorespace incappendhistory sharehistory
# Completion settings
setopt extendedglob globdots nomatch
# Reduce irritating feedback
unsetopt beep notify
