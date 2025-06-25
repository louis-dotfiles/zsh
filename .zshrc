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

# Faster keyboard repeat, very handy for Neovim.
xset r rate 250 35


source "$ZDOTDIR/completions/completions.zsh"
source "$ZDOTDIR/keybinds.zsh"
source "$ZDOTDIR/third_party/third_party.zsh"

source "$ZDOTDIR/plugins/plugins.zsh"


# Automatically start tmux.
if command -v tmux &> /dev/null \
  && [ -n "$PS1" ]              \
  && [[ ! "$TERM" =~ screen ]]  \
  && [[ ! "$TERM" =~ tmux ]]    \
  && [ -z "$TMUX" ];
then
  exec tmux
fi

