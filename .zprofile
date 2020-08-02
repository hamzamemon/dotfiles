#!/bin/zsh

# zsh profile file. Runs on login. Environmental variables set here.

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# Default programs
export BROWSER="firefox"
export EDITOR="nvim"
export FILE="ranger"
export LIBVA_DRIVER_NAME="radeonsi"
export READER="zathura"
export TERMINAL="termite"

# Global variables
export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$HOME/.config/zsh"


export LESS_TERMCAP_mb=$'\e[01;31m' \
LESS_TERMCAP_md=$'\E[01;38;5;74m' \
LESS_TERMCAP_me=$'\E[0m' \
LESS_TERMCAP_se=$'\E[0m' \
LESS_TERMCAP_so=$'\E[38;5;246m' \
LESS_TERMCAP_ue=$'\E[0m' \
LESS_TERMCAP_us=$'\E[04;38;5;146m' \
