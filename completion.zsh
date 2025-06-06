#!/usr/bin/zsh

# From https://github.com/sorin-ionescu/prezto/tree/master/modules/completion
#
# Sets completion options.
#
# Authors:
#   Robby Russell <robby@planetargon.com>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Return if requirements are not found.
if [[ "$TERM" == 'dumb' ]]; then
  return 1
fi

# Add zsh-completions to $fpath.
fpath+="${0:h}/external/src"


# Generate the FNM completions if needed.
# https://github.com/Schniz/fnm?tab=readme-ov-file#completions
# https://github.com/zsh-users/zsh-completions/blob/master/zsh-completions-howto.org#getting-started
if [[ ! -x $(which fnm) ]]; then
  echo "Executable 'fnm' was not found."
else
  FNM_COMPLETIONS_PATH="${XDG_DATA_HOME}/fnm/completion/_generated"

  if [[ ! -f "$FNM_COMPLETIONS_PATH" ]]; then
    mkdir -p $(dirname "$FNM_COMPLETIONS_PATH")

    echo "Generating FNM completions ..."
    fnm completions --shell zsh > $FNM_COMPLETIONS_PATH
    echo "FNM completions generated."
  fi

  fpath+=$(dirname "$FNM_COMPLETIONS_PATH")
fi


#
# Options
#

setopt COMPLETE_IN_WORD    # Complete from both ends of a word.
setopt ALWAYS_TO_END       # Move cursor to the end of a completed word.
setopt PATH_DIRS           # Perform path search even on command names with slashes.
setopt AUTO_MENU           # Show completion menu on a successive tab press.
setopt AUTO_LIST           # Automatically list choices on ambiguous completion.
setopt AUTO_PARAM_SLASH    # If completed parameter is a directory, add a trailing slash.
setopt EXTENDED_GLOB       # Needed for file modification glob modifiers with compinit.
unsetopt MENU_COMPLETE     # Do not autoselect the first completion entry.
unsetopt FLOW_CONTROL      # Disable start/stop characters in shell editor.

# Allow dotfiles completion.
_comp_options+=(globdots)


autoload -Uz compinit

# https://zsh.sourceforge.io/Doc/Release/Completion-System.html#Use-of-compinit
ZCOMPCACHE_DIR="$XDG_CACHE_HOME/zsh/zcompcache"
[[ ! -d "$ZCOMPCACHE_DIR" ]] && mkdir -p "$ZCOMPCACHE_DIR"

ZCOMPDUMP_FILE="$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"
[[ ! -f "$ZCOMPDUMP_FILE" ]] && mkdir -p $(dirname "$ZCOMPDUMP_FILE")

compinit -d "$ZCOMPDUMP_FILE"


# # Styles
# #
#
# # Use caching to make completion for commands such as dpkg and apt usable.
# zstyle ':completion::complete:*' use-cache on
# zstyle ':completion::complete:*' cache-path $ZCOMPCACHE_DIR
#
# # Case-insensitive (all), partial-word, and then substring completion.
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
#
# # Group matches and describe.
# zstyle ':completion:*:*:*:*:*' menu select
# zstyle ':completion:*:matches' group 'yes'
# zstyle ':completion:*:options' description 'yes'
# zstyle ':completion:*:options' auto-description '%d'
# zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
# zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
# zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
# zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
# zstyle ':completion:*:default' list-prompt '%S%M matches%s'
# zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*' verbose yes
#
# # Fuzzy match mistyped completions.
# zstyle ':completion:*' completer _complete _match _approximate
# zstyle ':completion:*:match:*' original only
# zstyle ':completion:*:approximate:*' max-errors 1 numeric
#
# # Increase the number of errors based on the length of the typed word. But make
# # sure to cap (at 7) the max-errors to avoid hanging.
# zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3>7?7:($#PREFIX+$#SUFFIX)/3))numeric)'
#
# # Don't complete unavailable commands.
# zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
#
# # Array completion element sorting.
# zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
#
# # Directories
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
# zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
# zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
# zstyle ':completion:*' squeeze-slashes true
#
# # History
# zstyle ':completion:*:history-words' stop yes
# zstyle ':completion:*:history-words' remove-all-dups yes
# zstyle ':completion:*:history-words' list false
# zstyle ':completion:*:history-words' menu yes
#
# # Environment Variables
# zstyle ':completion::*:(-command-|export):*' fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-}
#
# zstyle -e ':completion:*:hosts' hosts 'reply=(
#   ${=${=${=${${(f)"$(cat {/etc/ssh/ssh_,~/.ssh/}known_hosts(|2)(N) 2> /dev/null)"}%%[#| ]*}//\]:[0-9]*/ }//,/ }//\[/ }
#   ${=${(f)"$(cat /etc/hosts(|)(N) <<(ypcat hosts 2> /dev/null))"}%%(\#${_etc_host_ignores:+|${(j:|:)~_etc_host_ignores}})*}
#   ${=${${${${(@M)${(f)"$(cat ~/.ssh/config 2> /dev/null)"}:#Host *}#Host }:#*\**}:#*\?*}}
# )'
#
# # Don't complete uninteresting users...
# zstyle ':completion:*:*:*:users' ignored-patterns \
#   adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
#   dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
#   hacluster haldaemon halt hsqldb ident junkbust ldap lp mail \
#   mailman mailnull mldonkey mysql nagios \
#   named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
#   operator pcap postfix postgres privoxy pulse pvm quagga radvd \
#   rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs '_*'
#
# # ... unless we really want to.
# zstyle '*' single-ignored show
#
# # Ignore multiple entries.
# zstyle ':completion:*:(rm|kill|diff):*' ignore-line other
# zstyle ':completion:*:rm:*' file-patterns '*:all-files'
#
# # Kill.
# zstyle ':completion:*:*:*:*:processes' command 'ps -u $LOGNAME -o pid,user,command -w'
# zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;36=0=01'
# zstyle ':completion:*:*:kill:*' menu yes select
# zstyle ':completion:*:*:kill:*' force-list always
# zstyle ':completion:*:*:kill:*' insert-ids single
#
# # Man.
# zstyle ':completion:*:manuals' separate-sections true
# zstyle ':completion:*:manuals.(^1*)' insert-sections true
#
# # Media Players.
# zstyle ':completion:*:*:mpg123:*' file-patterns '*.(mp3|MP3):mp3\ files *(-/):directories'
# zstyle ':completion:*:*:mpg321:*' file-patterns '*.(mp3|MP3):mp3\ files *(-/):directories'
# zstyle ':completion:*:*:ogg123:*' file-patterns '*.(ogg|OGG|flac):ogg\ files *(-/):directories'
# zstyle ':completion:*:*:mocp:*' file-patterns '*.(wav|WAV|mp3|MP3|ogg|OGG|flac):ogg\ files *(-/):directories'
#
# # Mutt.
# if [[ -s "$HOME/.mutt/aliases" ]]; then
#   zstyle ':completion:*:*:mutt:*' menu yes select
#   zstyle ':completion:*:mutt:*' users ${${${(f)"$(<"$HOME/.mutt/aliases")"}#alias[[:space:]]}%%[[:space:]]*}
# fi
#
# # SSH/SCP/RSYNC.
# zstyle ':completion:*:(ssh|scp|rsync):*' tag-order 'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
# zstyle ':completion:*:(scp|rsync):*' group-order users files all-files hosts-domain hosts-host hosts-ipaddr
# zstyle ':completion:*:ssh:*' group-order users hosts-domain hosts-host users hosts-ipaddr
# zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
# zstyle ':completion:*:(ssh|scp|rsync):*:hosts-domain' ignored-patterns '<->.<->.<->.<->' '^[-[:alnum:]]##(.[-[:alnum:]]##)##' '*@*'
# zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'

