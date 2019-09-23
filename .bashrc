#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto -F'
PS1='[\e[92m\u\e[96m@\T \e[95m\w\e[0m]\$ '

alias vim='nvim'

function cd {
	builtin cd "$@" && ls -F
}

neofetch
source /usr/share/doc/pkgfile/command-not-found.bash
shopt -s checkwinsize
