#!/usr/bin/zsh


# Quickly go back to a specific parent directory instead of typing cd ../../.. redundantly.
# https://github.com/Tarrasch/zsh-bd


# zsh-bd returns some errors without this line.
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

