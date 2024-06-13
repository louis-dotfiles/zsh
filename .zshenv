####################################
# XDG Base directory specification #
####################################
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"



####################
# Default programs #
####################

export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"



##########
# Pagers #
##########

export MANPAGER="less"
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



