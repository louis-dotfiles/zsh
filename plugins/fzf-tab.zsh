#!/usr/bin/zsh


# Replace zsh's default completion selection menu with fzf!
# https://github.com/Aloxaf/fzf-tab


# Disable sort when completing `git checkout`.
zstyle ':completion:*:git-checkout:*' sort false

# set descriptions format to enable group support
# NOTE: don't use escape sequences (like '%F{red}%d%f') here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no

# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# custom fzf flags
# NOTE: fzf-tab does not follow FZF_DEFAULT_OPTS by default
zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=ctrl-y:accept --border
# To make fzf-tab follow FZF_DEFAULT_OPTS.
# NOTE: This may lead to unexpected behavior since some flags break this plugin. See Aloxaf/fzf-tab#455.
# zstyle ':fzf-tab:*' use-fzf-default-opts yes

# Switch group using `<` and `>`.
zstyle ':fzf-tab:*' switch-group '<' '>'

zstyle ':fzf-tab:*' fzf-pad 4

# https://github.com/Aloxaf/fzf-tab/wiki/Configuration#query-string
zstyle ':fzf-tab:*' query-string input

# Don't use that, the window is way to  narrow.
# zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

bindkey -M viins '^N' fzf-tab-complete


plug "Aloxaf/fzf-tab"

