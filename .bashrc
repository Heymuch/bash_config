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
	PS1="\[$(tput bold)\]\[\033[38;5;7m\]\h\[$(tput sgr0)\]\[$(tput bold)\]::\[\033[38;5;10m\]\u\[$(tput sgr0)\] \[$(tput bold)\][\[\033[38;5;12m\]\w\[$(tput sgr0)\]\[$(tput bold)\]]\[$(tput sgr0)\] "
else
	PS1="\h::\u [\w] "
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
alias ls='ls -l --group-directories-first --color=auto'
alias la='ls -lA --group-directories-first --color=auto'
alias ll='ls -alF -- group-directories-firts --color=auto'
alias l='ls -CF --group-directories-first --color=auto'
alias df='df -h'
alias cp='cp -i'
alias free='free -m'

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

# Cleanup
unset enable_colors
