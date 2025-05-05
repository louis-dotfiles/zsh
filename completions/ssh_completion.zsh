
# Source:
# https://github.com/sunlei/zsh-ssh/blob/master/zsh-ssh.zsh
#
# Parse the ssh config file and handle the include directives.
# This will effectively "join" all ssh config files together.
_parse_config_file() {
  # Enable PCRE matching
  setopt localoptions rematchpcre
  unsetopt nomatch

  local config_file_path=$(realpath "$1")
  while IFS= read -r line || [[ -n "$line" ]]; do
    if [[ $line =~ ^[Ii]nclude[[:space:]]+(.*) ]] && (( $#match > 0 )); then
      local include_path="${match[1]}"
      if [[ $include_path == ~* ]]; then
        # Replace the first occurrence of "~" in the string with the value of the environment variable HOME.
        local expanded_include_path=${include_path/#\~/$HOME}
      else
        local expanded_include_path="$HOME/.ssh/$include_path"
      fi

      # `~` used to force the expansion of wildcards in variables
      for include_file_path in $~expanded_include_path; do
        if [[ -f "$include_file_path" ]]; then
          # echo "# FILE: $include_file_path\n"
          _parse_config_file "$include_file_path"
        fi
      done
    else
      echo "$line"
    fi
  done < "$config_file_path"
}

SSH_CONFIG_FILE="$HOME/.ssh/config"
ssh_config=$(_parse_config_file $SSH_CONFIG_FILE)
# echo $ssh_config

# Source:
# https://stackoverflow.com/a/56760494
#
# Docs:
# https://zsh.sourceforge.io/Doc/Release/Expansion.html#Parameter-Expansion
# Good luck.
#
# f: Split the result of the expansion at newlines.
# @: In double quotes, array elements are put into separate words.
# M: Remove the non-matched elements. ${name:#pattern}
# z: Split the result of the expansion into words using shell parsing to find the words.
#
# Basically, this:
# 1. Splits the file into individual lines.
# 1. Keeps the lines matching "Host *"
# 1. Removed the "Host " part.
# 1. Split as words.

hosts=(${(z)${${(M)${(f)ssh_config}:#Host *}#Host }:#*[*?]*})
# echo "Hosts ${hosts}"

# Doesn't include hosts from history.
if [[ $#hosts -gt 0 ]]; then
  zstyle ':completion:*:ssh:*' hosts $hosts
  zstyle ':completion:*:slogin:*' hosts $hosts
fi

