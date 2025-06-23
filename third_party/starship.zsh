#!/usr/bin/zsh


# Prompt theme: https://starship.rs
if [[ -x $(which starship) && $TERM != "dumb" ]]; then
    eval "$(starship init zsh)"
fi

