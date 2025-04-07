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
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-history-substring-search"

# Load this plugin last.
# https://github.com/zsh-users/zsh-syntax-highlighting?tab=readme-ov-file#why-must-zsh-syntax-highlightingzsh-be-sourced-at-the-end-of-the-zshrc-file
plug "zsh-users/zsh-syntax-highlighting"



# Ctrl + y to use autosuggestions from zsh-autosuggestions.
# https://github.com/zsh-users/zsh-autosuggestions?tab=readme-ov-file#key-bindings
bindkey '^y' autosuggest-accept

