#########################################################
# BASH config file
# ~/.bashrc
#########################################################

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable programmable completion features
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Enable colors
enable_colors=true

# PS1 configuration
if ${enable_colors} ; then
	PS1="\[\033[38;5;7m\]\h \[\033[38;5;9m\]\W\[$(tput sgr0)\] "
else
	PS1="\h \W "
fi

# Enable colors for files and directories
if ${enable_colors} ; then
	if [ -x /usr/bin/dircolors ] ; then
		test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	fi
fi

# Colored GCC warnings and errors
GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Aliases
alias ls='ls --group-directories-first --color=auto'
alias la='ls -lA --group-directories-first --color=auto'
alias ll='ls -l --group-directories-first --color=auto'
alias df='df -h'
alias cp='cp -i'
alias free='free -m'

# PATH
export PATH=$PATH:~/.emacs.d/bin

# Command history
# number of history lines
HISTSIZE=1000
# size of history file
HISTFILESIZE=2000
# don't save duplicate lines or lines starting with space
HISTCONTROL=ignoreboth:erasedups
# append to the history file
shopt -s histappend

# resize when window resize
shopt -s checkwinsize

# enable ** pattern
shopt -s globstar

# Expand aliases
shopt -s expand_aliases

# SUDO prompt
export SUDO_PROMPT="$(tput bold)$(tput setaf 1)<< Word of Power >> $(tput sgr0)"

# Cleanup
unset enable_colors
