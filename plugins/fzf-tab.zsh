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
# NOTE: fzf-tab does not follow FZF_DEFAULT_OPTS by default. Because some FZF
# options can break the plugin.
zstyle ':fzf-tab:*' fzf-flags \
      --color=fg:#cacaca,fg+:#ffffff,bg:#121212,bg+:#262626 \
      --color=hl:#5f87af,hl+:#5fd7ff,info:#afaf87,marker:#87ff00 \
      --color=prompt:#d7005f,spinner:#af5fff,pointer:#af5fff,header:#87afaf \
      --color=border:#262626,label:#aeaeae,query:#d9d9d9 \
      --border="rounded" --border-label="" --preview-window="border-rounded" --prompt="> " \
      --marker=">" --pointer="◆" --separator="─" --scrollbar="│"

zstyle ':fzf-tab:complete:*' fzf-bindings \
    'ctrl-y:accept'

zstyle ':fzf-tab:*' accept-line enter
zstyle ':fzf-tab:*' continuous-trigger 'ctrl-/'

zstyle ':fzf-tab:*' switch-group '<' '>'

zstyle ':fzf-tab:*' fzf-pad 12


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


plug "Aloxaf/fzf-tab"
# plug "$HOME/Documents/louis/fzf-tab/fzf-tab.zsh"

