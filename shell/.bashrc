# ~/.bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -lA'
alias l='ls -CF'

# Alias for GNU info to use vi-like key bindings:
alias info='info --vi-keys'

# Alias for opening files with the default program and suppressing error messages:
alias o="xdg-open 2>/dev/null"

# Open Temp.txt in vim:
alias vt='nvim ~/Temp.txt'

# Ranger:
alias rg='ranger --choosedir=$HOME/rangerdir;cd $(cat $HOME/rangerdir)'

# Git aliases:
alias gall="git add -A"
alias gss="git status -s"
alias gla="git log --graph --pretty=format:'%C(yellow)%h%Creset%C(magenta)%d%Creset %s %C(blue)[%an] %C(cyan)(%cr)%Creset' --abbrev-commit --date=relative"
alias gls="git log -n 10 --pretty=format:'%C(yellow)%h%Creset%C(magenta)%d%Creset %s %C(blue)[%an] %C(cyan)(%cr)%Creset' --abbrev-commit --date=relative"
alias gc="git commit -v"
alias gca="git commit -a -v"
alias gcm="git commit -m"
alias gp="git push"
alias gl="git pull"
alias gu="git reset HEAD"

# Aliases for Todo-txt:
alias te='nvim ~/Nextcloud/Sync/todo-txt/todo.txt'
alias tl='nvim ~/Documents/todo-txt/todo.txt'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Use 256 color terminal:
# export TERM=xterm-256color

# Turn off system bell:
if [ -n "$DISPLAY" ]; then
  xset b off
fi

# Set default editor:
export VISUAL=nvim
export EDITOR="$VISUAL"

# Enable coloured man pages:
man() {
    env LESS_TERMCAP_md=$'\E[01;34m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[1;31m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[00;35m' \
    man "$@"
}

# Show a completion menu when pressing tab:
# bind TAB:menu-complete

# When given a directory name, cd to it:
shopt -s autocd

# Enable fzf shell integration if fzf is installed
if command -v fzf >/dev/null 2>&1; then
  eval "$(fzf --bash)"
fi

# Python 3 venv wrapper
# Code from https://gist.github.com/benlubas/5b5e38ae27d9bb8b5c756d8371e238e6

# Usage:
# $ mkvenv myvirtualenv # creates venv under ~/.virtualenvs/
# $ venv myvirtualenv   # activates venv
# $ deactivate          # deactivates venv
# $ rmvenv myvirtualenv # removes venv

export VENV_HOME="$HOME/.virtualenvs"
[[ -d $VENV_HOME ]] || mkdir $VENV_HOME

lsvenv() {
  ls -1 $VENV_HOME
}

venv() {
  if [ $# -eq 0 ]
    then
      echo "Please provide venv name"
    else
      source "$VENV_HOME/$1/bin/activate"
  fi
}

mkvenv() {
  if [ $# -eq 0 ]
    then
      echo "Please provide venv name"
    else
      python3 -m venv $VENV_HOME/$1
  fi
}

rmvenv() {
  if [ $# -eq 0 ]
    then
      echo "Please provide venv name"
    else
      rm -r $VENV_HOME/$1
  fi
}

# Created by `pipx` on 2026-04-13 15:04:40
export PATH="$PATH:/home/gbenadi/.local/bin"
