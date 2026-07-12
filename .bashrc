# XDG Base Directory Specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# History Files Specification
export HISTFILE="$XDG_CACHE_HOME/bash_history"
export PYTHONHISTORY="$XDG_CACHE_HOME/python_history"
export LESSHISTORYFILE="$XDG_CACHE_HOME/less_history"

# Android, Gradle
export ANDROID_USER_HOME="$XDG_DATA_HOME/android"
export GRADLE_USER_HOME="$XDG_CACHE_HOME/gradle"

# Rust & Cargo
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export PATH="$CARGO_HOME/bin:$PATH"

# Node, Docker & Go
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export GOPATH="$XDG_DATA_HOME/go"

# Miscellaneous
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GIT_CONFIG_GLOBAL="$XDG_CONFIG_HOME/git/config"
export LANG=en_US.UTF-8
if command -v micro &>/dev/null; then
  export EDITOR=micro
else
  export EDITOR=nano
fi

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# Don't put duplicate lines or lines starting
# with a space in history.
HISTCONTROL=ignoreboth
HISTIGNORE="ls:ll:la:cd:pwd:clear:exit:history"
HISTFILESIZE=10000
HISTSIZE=10000

if [[ ! "$PROMPT_COMMAND" =~ "history -a" ]]; then
  PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
fi

# Append to history file, don't overrite.
shopt -s histappend

# Check window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Modern PS1 Options
# Uncomment desired PS1
if [ "$color_prompt" = yes ] || [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  #    PS1='\[\e[0;38;5;82m\]$ \[\e[0;38;5;45m\]\u \[\e[0;38;5;45m\](\[\e[0;38;5;39m\]\W\[\e[0;38;5;45m\]) \[\e[0;1;38;5;45m\]>\[\e[0m\]'
  #    PS1='\[\e[1;32m\]\u@\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]\$ '
  PS1='\[\e[0;2;38;5;226m\]\$ \[\e[0;1;38;5;154m\]\u \[\e[0;2;38;5;157m\]in \[\e[0;1;38;5;208m\]\W \[\e[0;38;5;43m\]> \[\e[0m\]'
  #    PS1='\[\e[0;2;38;5;46m\]$ \[\e[0;2;38;5;46m\]\u \[\e[0;2;38;5;47m\](\[\e[0;1;38;5;46m\]\W\[\e[0;2;38;5;47m\]) \[\e[0;1;38;5;46m\]>\[\e[0m\]'
else
  PS1='\u@\h:\w\$ '
fi

# Advanced Tab Completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Case-insensitive completion
bind 'set completion-ignore-case on'

# Colors & Aliases

# eza
if command -v eza &>/dev/null; then
  alias dl="eza --icons --group-directories-first"
  alias dll="eza -lbF --icons --group-directories-first"
  alias dla="eza -lbabghHliS --icons --group-directories-first"
else
  echo "Command 'eza' is inaccessible." >&2
fi

# ls
alias ls="ls --color=auto --group-directories-first"
alias ll="ls -alF --color=auto"
alias la="ls -A --color=auto"

alias grep="grep --color=auto"
alias diff="diff --color=auto"
