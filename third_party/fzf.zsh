#!/usr/bin/zsh


# fzf is a general-purpose command-line fuzzy finder.
# https://github.com/junegunn/fzf


# Automatically download FZF if needed.
# I have made the conscious decision NOT to use the system package manager
# because I want this configuration to be somewhat portable (for work, where I
# won't have Archlinux for example), and because distributions like Ubuntu are
# waaaayyyyyy behind on package versions.
#
# https://github.com/junegunn/fzf?tab=readme-ov-file#using-git
FZF_DIR="$XDG_DATA_HOME/fzf"
if [[ ! -d "$FZF_DIR" ]]; then
    echo "Installing the FZF fuzzy finder..."

    git clone                                 \
        -c advice.detachedHead=false          \
        --branch='v0.67.0'                    \
        --depth=1                             \
        'https://github.com/junegunn/fzf.git' \
        $FZF_DIR

    # Installation.
    # This generates a bunch of superfluous additional files. ALl we really
    # need is to edit the $PATH.
    # source "$FZF_DIR/install" \
    #     --key-bindings        \
    #     --no-completion       \
    #     --no-update-rc        \
    #     --xdg

    [ $? -ne 0 ] && echo "FZF installation error." || echo "FZF was installed."
fi


path+=("$FZF_DIR/bin")

[[ -x $(which fzf) ]] && source <(fzf --zsh) || echo "FZF is not installed."

