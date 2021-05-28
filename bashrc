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

# Git Function
function git_branch {
	echo $(git branch --show-current 2> /dev/null)
}

function ps1_git {
	local branch=$(git_branch)
	if [ $branch ] ; then
		echo " <${branch}>"
	fi
}

# PS1 configuration
function ps1_config {
	if $enable_colors ; then
		# Barvy
		local grey="\[$(tput setaf 8)\]"
		local red="\[$(tput setaf 1)\]"
		local blue="\[$(tput setaf 4)\]"
		local yellow="\[$(tput setaf 3)\]"
		local bold="\[$(tput bold)\]"
		local reset="\[$(tput sgr0)\]"

		echo "${bold}${grey}[ ${red}\W ${grey}]${blue}\$(ps1_git)${grey} ~> ${reset}"
	else
		echo "[ \u@\h \W \$(ps1_git)] "
	fi
}

PS1=$(ps1_config)

# Enable colors for files and directories
if ${enable_colors} ; then
	if [ -x /usr/bin/dircolors ] ; then
		test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	fi
fi

# Colored GCC warnings and errors
GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Aliases
alias ls='ls --group-directories-first --color=auto --file-type'
alias la='ls -lAhv --group-directories-first --color=auto --file-type'
alias ll='ls -lhgGv --group-directories-first --color=auto --file-type'
alias tree='tree --du --si --dirsfirst -L 3'
alias trea='tree --du --si --dirsfirst -L 3 -a'
alias df='df -h'
alias cp='cp -i'
alias free='free -m'
alias htop='htop -t'

# Docker Aliases
alias gradle_jdk12="docker run --name gradle_jdk12 --rm -it -v \$(pwd):/app -u \$(id -u):\$(id -u) -w /app gradle:jdk12 bash"

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
export SUDO_PROMPT="$(tput bold)$(tput setaf 8)[$(tput setaf 1) JUST SAY IT! $(tput setaf 8)] ~>$(tput sgr0) "
