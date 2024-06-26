# ZSH configuration README

This is my configuration for the [ZSH](https://www.zsh.org/) shell.

This configuration includes:
- [.zshenv](./.zshenv) is an "env" file that exports a lot of environment
  variables to configure various of programs, e.g. where their configurations
  should be stored. For example it defines `~/.config/zsh/` as the home directory
  for ZSH configurations.  
  One of the goals of this configuration is to have a reasonably clean and
  ordered home directory by following the [XDG base directory
  specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html).
- [.zshrc](./.zshrc) is the core of the ZSH configuration where we set Zsh
  options. This is also where we run things before ZSH itself actually starts.  
  Some of the things configured there:
  - [plugins.zsh](./plugins.zsh): the plugins configuration, currently using the [Zap](https://github.com/zap-zsh/zap) plugin manager.
  - [completion.zsh](./completion.zsh): the command line completion configuration.

## Installation

You have to do is clone this repository in `~/.config/zsh`,
i.e. [~/.config/zsh/.zshrc](~/.config/zsh/.zshrc) should be
[this file](./.zshrc). Symlinking is also a popular option.

Additionally you may have to symlink [~/.zshenv](~/.zshenv) to the [.zshenv file](./.zshenv).

