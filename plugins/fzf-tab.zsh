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
zstyle ':completion:*' menu no

# zstyle ':completion:*' completer _complete

# Custom fzf flags.
# NOTE: fzf-tab does not follow FZF_DEFAULT_OPTS by default.
zstyle ':fzf-tab:*' fzf-flags \
    --color=fg:1,fg+:2 \
    --border \
    --header-lines-border=bottom


zstyle ':fzf-tab:complete:*' fzf-bindings \
    'ctrl-y:accept'

zstyle ':fzf-tab:*' accept-line enter
zstyle ':fzf-tab:*' continuous-trigger '/'

zstyle ':fzf-tab:*' switch-group '<' '>'

zstyle ':fzf-tab:*' fzf-pad 12

zstyle ':fzf-tab:*' continuous-trigger 'ctrl-/'

# The documentation says it's "to indicate the color".
# No clue what they meant by that.
# It's the character before the suggested items.
zstyle ':fzf-tab:*' prefix ''

zstyle ':fzf-tab:complete:*' query-string input


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

zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
    "git rev-list --left-right --count HEAD...\$word 2>/dev/null | awk '{ print \$1, \" Ahead |\", \$2, \" Behind\" }'"


bindkey -M viins '^N' fzf-tab-complete


# plug "Aloxaf/fzf-tab"
plug "$HOME/Documents/louis/fzf-tab/fzf-tab.zsh"

