## autoload vcs and colors
autoload -Uz vcs_info
autoload -U colors && colors

# enable only git 
zstyle ':vcs_info:*' enable git 
zstyle ':vcs_info:git:*' formats '%F{240}(%b) %r%f'

# setup a hook that runs before every prompt. 
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

PROMPT='%B%F{226}[%f %F{13}%~%f %F{226}]%f%b %F{208}%%%f '
RPROMPT='%B%F{226}%t%b '\$vcs_info_msg_0_
