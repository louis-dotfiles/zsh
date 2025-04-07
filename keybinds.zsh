#!/usr/bin/zsh

# Vim mode.
bindkey -v
export KEYTIMEOUT=1

# Edit commands with vim.
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd '^]' edit-command-line


# "Next" and "Previous" completion.
bindkey -M viins '^I' menu-complete # Tab.
bindkey -M viins '^[[Z' reverse-menu-complete # Shift + Tab.

bindkey -M viins '^N' menu-complete
bindkey -M viins '^P' reverse-menu-complete

# Expand wildcards for example.
bindkey -M viins '^E' expand-word


