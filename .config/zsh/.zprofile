#!/bin/zsh

# zsh profile file. Runs on login. Environmental variables set here.

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin" | cut -f2 | paste -sd ':')"

# Default programs
if hash nvim 2>/dev/null; then
  export EDITOR="nvim"

  # Use nvim as manpager `:h Man`
  export MANPAGER='nvim +Man!'
else
  export EDITOR="vim"
fi

export BROWSER="brave"
export FILE="lf"
export TERMINAL="alacritty"
export READER="zathura"

# Global variables
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export ZDOTDIR="$HOME/.config/zsh"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"
export JAVA_HOME="/usr/lib/jvm/default"
export PATH="/usr/lib/ccache/bin/:$PATH"
export MAKEFLAGS="-j17 -l16"
export GDK_SCALE=1
export GDK_DPI_SCALE=1
export SHELL=/bin/zsh

# Something for me to see where aliases get defined
# Use 256 colors
# export TERM=xterm-256color
export LANG=en_US.UTF8
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# Hardware acceleration
unset LIBVA_DRIVER_NAME VDPAU_DRIVER DRI_PRIME
if lspci -k | grep -q -e amdgpu -e radeon; then
	export LIBVA_DRIVER_NAME=radeonsi
	export VDPAU_DRIVER=radeonsi
elif lspci -k | grep -q nouveau; then
	export LIBVA_DRIVER_NAME=nouveau
	export VDPAU_DRIVER=nouveau
fi

if lspci -k | grep -q i915; then
	if [ -z "$LIBVA_DRIVER_NAME" ]; then
		export LIBVA_DRIVER_NAME=i965
		export VDPAU_DRIVER=va_gl
	else
		export DRI_PRIME=1
	fi
fi

# Other program settings
export LESS_TERMCAP_mb=$'\e[01;31m' \
LESS_TERMCAP_md=$'\E[01;38;5;74m' \
LESS_TERMCAP_me=$'\E[0m' \
LESS_TERMCAP_se=$'\E[0m' \
LESS_TERMCAP_so=$'\E[38;5;246m' \
LESS_TERMCAP_ue=$'\E[0m' \
LESS_TERMCAP_us=$'\E[04;38;5;146m' \

# `lf` icons:
export LF_ICONS="di=📁:\
fi=📃:\
tw=🤝:\
ow=📂:\
ln=⛓:\
or=❌:\
ex=🎯:\
*.txt=✍:\
*.mom=✍:\
*.me=✍:\
*.ms=✍:\
*.png=🖼:\
*.webp=🖼:\
*.ico=🖼:\
*.jpg=📸:\
*.jpe=📸:\
*.jpeg=📸:\
*.gif=🖼:\
*.svg=🗺:\
*.tif=🖼:\
*.tiff=🖼:\
*.xcf=🖌:\
*.html=🌎:\
*.xml=📰:\
*.gpg=🔒:\
*.css=🎨:\
*.pdf=📚:\
*.djvu=📚:\
*.epub=📚:\
*.csv=📓:\
*.xlsx=📓:\
*.tex=📜:\
*.md=📘:\
*.r=📊:\
*.R=📊:\
*.rmd=📊:\
*.Rmd=📊:\
*.m=📊:\
*.mp3=🎵:\
*.opus=🎵:\
*.ogg=🎵:\
*.m4a=🎵:\
*.flac=🎼:\
*.wav=🎼:\
*.mkv=🎥:\
*.mp4=🎥:\
*.webm=🎥:\
*.mpeg=🎥:\
*.avi=🎥:\
*.mov=🎥:\
*.mpg=🎥:\
*.wmv=🎥:\
*.m4b=🎥:\
*.flv=🎥:\
*.zip=📦:\
*.rar=📦:\
*.7z=📦:\
*.tar.gz=📦:\
*.z64=🎮:\
*.v64=🎮:\
*.n64=🎮:\
*.gba=🎮:\
*.nes=🎮:\
*.gdi=🎮:\
*.1=ℹ:\
*.nfo=ℹ:\
*.info=ℹ:\
*.log=📙:\
*.iso=📀:\
*.img=📀:\
*.bib=🎓:\
*.ged=👪:\
*.part=💔:\
*.torrent=🔽:\
*.jar=♨:\
*.java=♨:\
"
