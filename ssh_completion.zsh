
# Parse the file and handle the include directive.
# This will efrfectively "join" all ssh config files together.
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
          # Insert a blank line between the included files
          echo "# FILE: $include_file_path\n"
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
echo $ssh_config

# https://zsh.sourceforge.io/Doc/Release/Expansion.html#Parameter-Expansion
# Good luck.
ssh_config_lines=${(f)ssh_config}
echo $ssh_config_lines
# hosts=(${${${(@M)${(f)ssh_config}:#Host *}#Host }:#*[*?]*})
hosts=(${${${(@M)ssh_config_lines:#Host *}#Host }:#*[*?]*})

# echo ${(q)hosts}

if [[ $#hosts -gt 0 ]]; then
  zstyle ':completion:*:ssh:*' hosts $hosts
  zstyle ':completion:*:slogin:*' hosts $hosts
fi

