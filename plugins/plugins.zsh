#!/usr/bin/zsh

# Automatically download the plugins manager if needed.
# https://github.com/zap-zsh/zap
ZAP="$XDG_DATA_HOME/zap/zap.zsh"
if [[ ! -f "$ZAP" ]]; then
  echo "Installing the Zap plugin manager..."
  zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 --keep
  echo "Zap was installed."
fi

source "$ZAP"



# Plugins definitions.
PLUGINS_DIR="$ZDOTDIR/plugins"
source "$PLUGINS_DIR/fzf-tab.zsh"
source "$PLUGINS_DIR/zsh-autosuggestions.zsh"
source "$PLUGINS_DIR/zsh-bd.zsh"

plug "zsh-users/zsh-history-substring-search"

# Load this plugin last.
# https://github.com/zsh-users/zsh-syntax-highlighting?tab=readme-ov-file#why-must-zsh-syntax-highlightingzsh-be-sourced-at-the-end-of-the-zshrc-file
plug "zsh-users/zsh-syntax-highlighting"

source "$ZDOTDIR/completions/ssh_completion.zsh"

