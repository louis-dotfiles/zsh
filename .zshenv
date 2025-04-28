#!/usr/bin/zsh

####################################
# XDG Base directory specification #
####################################
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"



########
# PATH #
########

# https://github.com/Schniz/fnm
path+=("$XDG_DATA_HOME/fnm")



####################
# Default programs #
####################

export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"



##########
# Pagers #
##########

export MANPAGER="nvim +'Man!'"
export BAT_PAGER="less"



#######
# ZSH #
#######
# https://zsh.sourceforge.io/Doc/
# https://zsh-manual.netlify.app/the-z-shell-manual

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$XDG_DATA_HOME/zsh/history"

# Required for ZSH to save any history at all.
export SAVEHIST=1000
export HISTSIZE=1000


# Prevent ZSH from using compinit on its own.
# This is done to prevent it from dumping its cache files in the default
# locations.
export skip_global_compinit=1


export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=50
export ZSH_AUTOSUGGEST_USE_ASYNC=true



########
# Rust #
########
# https://web.mit.edu/rust-lang_v1.25/arch/amd64_ubuntu1404/share/doc/rust/html/cargo/reference/environment-variables.html#environment-variables-cargo-reads

export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"



###########
# ANSIBLE #
###########

export ANSIBLE_CONFIG="$XDG_CONFIG_HOME/ansible/ansible.cfg"



########
# LESS #
########
# https://www.man7.org/linux/man-pages/man1/less.1.html#ENVIRONMENT_VARIABLES

export LESSKEY="$XDG_CONFIG_HOME/less/lesskey"
export LESSHISTFILE="$XDG_DATA_HOME/less/history"
export LESS='--RAW-CONTROL-CHARS --status-column --line-numbers --hilite-unread --no-histdups'

# Coloring is complicated so hold on to your butt.
#
# Styling (not just coloring) is done with ANSI escape sequences.
# https://en.wikipedia.org/wiki/ANSI_escape_code
#
# Such sequences are composed as follows (in shell scripts at least):
# `\e[<sequences>m`
#
# Where `<sequences>` is a list of numbers separated by semicolons ';'.
# 
# Particular combinations of numbers mean different things, such as 'bold', 'italic', 'underline'
# and colors.
#
# To define a color you should use:
# - `38;2;R;G;B` to define RGB foreground.
# - `48;2;R;G;B` to define RGB background.

# #7aa6da
# #70c0b1
# #b4ec4a
# #e7c547
# #e78c45
# #d54e53
# #c397d8

export LESS_TERMCAP_md=$'\e[1m' # Start bold.
export LESS_TERMCAP_us=$'\e[4;38;2;185;221;74;48;2;0;0;0m' # Start underline.
export LESS_TERMCAP_so=$'\e[1;48;2;231;197;71;38;2;0;0;0m' # Start standout.

# Style restets.
export LESS_TERMCAP_me=$'\e[0m' # End bold.
export LESS_TERMCAP_ue=$'\e[0m' # End underline.
export LESS_TERMCAP_se=$'\e[0m' # End standout.



########
# Node #
########
# https://nodejs.org/api/repl.html#environment-variable-options

export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"



######
# ls #
######
# Define default colors for ls. It is required for some plugins to work
# properly.

export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';

