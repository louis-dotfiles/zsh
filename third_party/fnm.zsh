#!/usr/bin/zsh


# Fast Node Manager.
# https://github.com/Schniz/fnm?tab=readme-ov-file#shell-setup


# FNM installation method will vary depending on the OS. So we are not going to
# automatically install it.
FNM_PATH="$XDG_DATA_HOME/fnm"
if [ -d $FNM_PATH ]; then
    path=($FNM_PATH $path)
    eval "`fnm env`"
fi


# Generate the FNM completions if needed.
# https://github.com/Schniz/fnm?tab=readme-ov-file#completions
if [[ ! -x $(which fnm) ]]; then
    echo "Executable 'fnm' was not found."
else
    FNM_COMPLETIONS_PATH="$FNM_PATH/completion/_generated"

    if [[ ! -f $FNM_COMPLETIONS_PATH ]]; then
        mkdir -p $(dirname $FNM_COMPLETIONS_PATH)

        echo "Generating FNM completions ..."
        fnm completions --shell zsh > $FNM_COMPLETIONS_PATH
        echo "FNM completions generated."
    fi

    fpath+=$(dirname $FNM_COMPLETIONS_PATH)


    eval "$(fnm env --use-on-cd)"
fi

