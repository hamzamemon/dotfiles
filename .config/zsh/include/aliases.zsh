# Re-source the zshrc
alias s='source ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.zshrc'

# Override commands with simple QoL
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -vI'
alias mkd='mkdir -pv'
ffmpeg='ffmpeg -hide_banner'

# Add colors when possible
alias ls='ls -hN --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias diff='diff --color=auto'

# Use neovim for vim if present
[ -x "$(command -v nvim)" ] && alias vim="nvim" vimdiff="nvim -d"
