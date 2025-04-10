#!/usr/bin/zsh

# Import aliases.
ALIASES_FILE="$XDG_CONFIG_HOME/aliases/aliases.sh"
[[ -r "$ALIASES_FILE" ]] && source "$ALIASES_FILE"



# Default file permissions.
umask 027 # Reminder: these are the disallowed actions.



# History options.
[[ ! -f "$HISTFILE" ]] && mkdir -p $(dirname "$HISTFILE")

setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt NO_HIST_BEEP
setopt HIST_IGNORE_ALL_DUPS



# Miscellanous.
setopt NO_BEEP



# Load command completion.
COMPLETION_CONF_FILE="$ZDOTDIR/completion.zsh"
[[ -r "$COMPLETION_CONF_FILE" ]] && source "$COMPLETION_CONF_FILE"


# Load keybinds.
KEYBINDS_CONF_FILE="$ZDOTDIR/keybinds.zsh"
[[ -r "$KEYBINDS_CONF_FILE" ]] && source "$KEYBINDS_CONF_FILE"


# Fast Node Manager.
# https://github.com/Schniz/fnm?tab=readme-ov-file#shell-setup
eval "$(fnm env --use-on-cd)"



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


# Load plugins.
# Loading plugins last is important.
PLUGINS_CONF_FILE="$ZDOTDIR/plugins.zsh"
[[ -r "$PLUGINS_CONF_FILE" ]] && source "$PLUGINS_CONF_FILE"


# Automatically start zsh
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

