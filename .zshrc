# Import aliases.
[[ -r "$XDG_CONFIG_HOME/aliasrc" ]] && source "$XDG_CONFIG_HOME/aliasrc"



# Default file permissions.
umask 027 # Reminder: these are the disallowed actions.



# History options.
[[ -n "$HISTFILE" ]] && mkdir -p "$(dirname "$HISTFILE")"

setopt HISTIGNOREALLDUPS



# Miscellanous.
setopt nobeep



# Load command completion.
COMPLETION_CONF_FILE="$ZDOTDIR/completion.zsh"
[[ -r "$COMPLETION_CONF_FILE" ]] && source "$COMPLETION_CONF_FILE"

# Ctrl + Space to use autosuggestions from zsh-autosuggestions.
bindkey '^ ' autosuggest-accept



# Vim mode.
bindkey -v # Use <C-[> and then <v> to open the current command in Vim.
export KEYTIMEOUT=1

# Edit commands with vim.
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line



# Prompt theme: https://starship.rs
if [[ $TERM != "dumb" ]]; then
  eval "$(starship init zsh)"
fi

# Faster keyboard repeat, very handy for Neovim.
xset r rate 250 35


