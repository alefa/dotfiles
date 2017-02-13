# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

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

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
	# Red bold prompt with working directory in blue and git branch in purple:
    PS1='${debian_chroot:+($debian_chroot)}\[\033[1;31m\]\u@\h\[\033[00m\]:\[\033[0;34m\]\W\[\033[00m\]\[\033[0;35m\]$(__git_ps1 "(%s)")\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W$(__git_ps1 "(%s)")\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

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

# Alias for adding files to Neovim:
alias v='nvr --remote'

# Alias for GNU info to use vi-like key bindings:
alias info='info --vi-keys'

# Alias for opening files with the default program:
alias open="xdg-open"

# Open Temp.txt in vim:
alias vt='nvim /home/gita/Temp.txt'

# Git aliases:
alias gcl='git clone'
alias ga='git add'
alias gu='git reset HEAD'
alias gall='git add -A'
alias gai='git add -i'
alias gm='git merge'
alias gs='git status -s'
alias gl='git pull'
alias gp='git push'
alias gpom='git push origin master'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gcA='git commit -v --amend'
alias gco='git checkout'
alias gcom='git checkout master'
alias gt='git tag'
alias gls="git log --graph --pretty=format:'%C(yellow)%h%Creset%C(magenta)%d%Creset %s %C(blue)[%an] %C(cyan)(%cr)%Creset' --abbrev-commit --date=relative"
alias ggr='git grep -Ii'
alias grv='git remote -v'


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

# NVim-R setup:
# Change the TERM environment variable (to get 256 colors) and make Vim
# connecting to X Server even if running in a terminal emulator (to get
# dynamic update of syntax highlight and Object Browser):
if [ "x$DISPLAY" != "x" ]
then
   if [ "screen" = "$TERM" ]
   then
       export TERM=screen-256color
   else
       export TERM=xterm-256color
   fi
fi

# Use autojump for faster directory navigation:
. /usr/share/autojump/autojump.sh

# Set default pager (to correct an error in ranger's configuration):
export PAGER=less

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
bind TAB:menu-complete

# When given a directory name, cd to it:
shopt -s autocd

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
