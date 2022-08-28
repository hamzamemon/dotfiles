# Change directory colors
LS_COLORS=$LS_COLORS:'di=1;32:';
export LS_COLORS

# History
HISTSIZE=10000000
SAVEHIST=$HISTSIZE
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"
# Remove blank lines from history
setopt hist_reduce_blanks
# Adds commands as they are typed, not at shell exit
setopt inc_append_history

# Setup a custom completion directory
fpath=("${XDG_DATA_HOME:-$HOME/.local/share}"/zsh/completions $fpath)

# Enable the completion system
autoload -Uz +X compinit && compinit -u
zstyle ':completion:*' menu select
# Auto complete with case insensitivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
# Initialize all completions on $fpath and ignore (-i) all insecure files and directories
compinit -i
# Include hidden files
_comp_options+=(globdots)
# Case insensitive globbing
setopt no_case_glob

# Some useful options
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef # Disable Ctrl-S to freeze terminal

# Useful Functions
source "$ZDOTDIR/zsh-functions"

# Add plugins
zsh_add_plugin 'zsh-users/zsh-syntax-highlighting'
zsh_add_plugin 'zsh-users/zsh-autosuggestions'
zsh_add_plugin 'zsh-users/zsh-completions'
zsh_add_plugin "hlissner/zsh-autopair"
zsh_add_plugin 'agkozak/zsh-z'

# Search repos for commands that cannot be found
source /usr/share/doc/pkgfile/command-not-found.zsh

bindkey '^ ' autosuggest-accept
bindkey '^n' autosuggest-accept

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'

## Import local plugins
sources=(
  'aliases'
  'functions'
  'git'
  'npm'
  'prompt'
  'vim'
)
for s in "${sources[@]}"; do
  source $XDG_CONFIG_HOME/zsh/include/${s}.zsh
done

# FZF
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f $ZDOTDIR/completion/_fnm ] && fpath+="$ZDOTDIR/completion/"
# export FZF_DEFAULT_COMMAND='rg --hidden -l ""'
compinit
