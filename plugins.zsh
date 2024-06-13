ZAP="$XDG_DATA_HOME/zap/zap.zsh" 
if [[ ! -f "$ZAP" ]]; then
  echo "Installing the Zap plugin manager..."
  zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 --keep
  echo "Zap was installed."
fi

source "$ZAP"

plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"


# Ctrl + Space to use autosuggestions from zsh-autosuggestions.
# https://github.com/zsh-users/zsh-autosuggestions?tab=readme-ov-file#key-bindings
bindkey '^ ' autosuggest-accept

