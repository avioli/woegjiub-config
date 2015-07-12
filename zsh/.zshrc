# load the XDG basedirs and aliases
    XDG_CONFIG_HOME="$(dirname ${(%):-%x})/.."
    source "$XDG_CONFIG_HOME/sh/xdg.sh"

# Source zsh-specific config
    source "$XDG_CONFIG_HOME/zsh/shopt.zsh"
    source "$XDG_CONFIG_HOME/zsh/completion.zsh"
    source "$XDG_CONFIG_HOME/zsh/keybindings.zsh"
    source "$XDG_CONFIG_HOME/zsh/prompt.zsh"

# Source common shell config (requires bash completion from above)
    source "$XDG_CONFIG_HOME/sh/rc.sh"

# Load Aliases, plugins, and Functions
    [[ -d "$XDG_CONFIG_HOME/zsh/functions/" ]] && for f in "$XDG_CONFIG_HOME/zsh/functions/*"; do . "$f"; done
    if [[ -d "$XDG_CONFIG_HOME/zsh/plugins/" ]]; then
    	for f in "$XDG_CONFIG_HOME/zsh/plugins/"*; do
    		. "$f"/*.zsh
    	done
    fi
    [[ -f "$XDG_CONFIG_HOME/zsh/aliases.sh" ]] && .  "$XDG_CONFIG_HOME/zsh/aliases.sh"
    [[ -f "$XDG_CONFIG_HOME/zsh/saliases.sh" ]] && .  "$XDG_CONFIG_HOME/zsh/saliases.sh"
