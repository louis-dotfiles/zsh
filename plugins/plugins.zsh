#!/usr/bin/zsh


# ⚡ Zap is a minimal zsh plugin manager.
# https://github.com/zap-zsh/zap


# Automatically download the plugins manager if needed.
ZAP="$XDG_DATA_HOME/zap/zap.zsh"
if [[ ! -f "$ZAP" ]]; then
    echo "Installing the Zap plugin manager..."
    zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 --keep
    echo "Zap was installed."
fi

source "$ZAP"


# Plugin definitions.
PLUGINS_DIR="${0:h}"

plug "zsh-users/zsh-completions"

# https://github.com/Aloxaf/fzf-tab?tab=readme-ov-file#install
source "$PLUGINS_DIR/fzf-tab.zsh"

source "$PLUGINS_DIR/zsh-autosuggestions.zsh"
source "$PLUGINS_DIR/zsh-bd.zsh"

plug "zsh-users/zsh-history-substring-search"

# Load this plugin last.
# https://github.com/zsh-users/zsh-syntax-highlighting?tab=readme-ov-file#why-must-zsh-syntax-highlightingzsh-be-sourced-at-the-end-of-the-zshrc-file
plug "zsh-users/zsh-syntax-highlighting"

