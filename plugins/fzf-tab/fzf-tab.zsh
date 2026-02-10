#!/usr/bin/zsh


# Replace zsh's default completion selection menu with fzf!
# https://github.com/Aloxaf/fzf-tab
#
# Reminder that fzf does not generate the suggestions. It only filters them.



# Disable sort when completing `git checkout`.
# zstyle ':completion:*:git-checkout:*' sort false



# set descriptions format to enable group support
# NOTE: don't use escape sequences (like '%F{red}%d%f') here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'



# set list-colors to enable filename colorizing
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}



# Force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
# Has no noticeable effect.
# zstyle ':completion:*' menu no



# Custom fzf flags.
# NOTE: fzf-tab does not follow FZF_DEFAULT_OPTS by default because some FZF
# options can break the plugin.
zstyle ':fzf-tab:*' fzf-flags \
    --color=fg:#cacaca      \
    --color=fg+:#ffffff     \
    --color=bg:#121212      \
    --color=bg+:#262626     \
    --color=hl:#5f87af      \
    --color=hl+:#5fd7ff     \
    --color=info:#afaf87    \
    --color=marker:#87ff00  \
    --color=prompt:#d7005f  \
    --color=spinner:#af5fff \
    --color=pointer:#af5fff \
    --color=header:#87afaf  \
    --color=border:#262626  \
    --color=label:#aeaeae   \
    --color=query:#d9d9d9   \
    \
    --border="rounded"                \
    --border-label=""                 \
    --preview-window="border-rounded" \
    --prompt="> "                     \
    --marker=">"                      \
    --pointer="◆"                     \
    --separator="─"                   \
    --scrollbar="│"                   \
    \
    --bind=ctrl-b:preview-half-page-up   \
    --bind=ctrl-f:preview-half-page-down \
    --bind=ctrl-y:accept



zstyle ':fzf-tab:*' fzf-pad 12



# I had trouble specifying fzf keybindings through fzf-tab, so just use the fzf-flags option above.
# Keybindings for fzf-tab specific features below.

# This will accept the option AND run the command.
zstyle ':fzf-tab:*' accept-line enter

# Accept the option and keep completing.
zstyle ':fzf-tab:*' continuous-trigger 'ctrl-/'

zstyle ':fzf-tab:*' switch-group '<' '>'



bindkey -M viins '^N' fzf-tab-complete



# The documentation says it's "to indicate the color".
# No clue what they meant by that.
# It's the character before the suggested items.
zstyle ':fzf-tab:*' prefix ''

zstyle ':fzf-tab:complete:*' query-string input



# Make the preview scripts available in the $PATH.
DIR="${0:h}"
path+=("$DIR/scripts/")



# Previews.
# https://github.com/Aloxaf/fzf-tab/wiki/Preview

zstyle ':fzf-tab:complete:ssh:*' fzf-preview \
    'ssh -TG $word | grep -iE "^User |^HostName |^Port |^IdentityFile |^ProxyJump"'

zstyle ':fzf-tab:complete:systemctl-(stop|start|enable|disable):*' fzf-preview \
    'SYSTEMD_COLORS=1 systemctl cat $word'

zstyle ':fzf-tab:complete:systemctl-status:*' fzf-preview \
    'SYSTEMD_COLORS=1 systemctl status $word'

zstyle ':fzf-tab:complete:(cd|pushd):*' fzf-preview \
    'eza --long --group --group-directories-first --header --color=always $realpath'

zstyle ':fzf-tab:complete:(eza|ls):*' fzf-preview \
    'eza --long --group --group-directories-first --header --color=always --all --all $realpath'

zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
    fzf_tab_preview_git_checkout

