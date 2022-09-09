# Aliases
alias g='git'
alias gs='git status'
alias grhh='git reset --hard HEAD'

# Adding aliases
alias ga='git add'
alias gadd='git add .'
alias gcom='git commit -m'

# Branch aliases
alias gb='git branch'
alias gbD='git branch -D'

# Pull/push aliases
alias gf='git fetch'
alias gl='git pull'
alias glom='git pull origin $(git_main_branch)'
alias glod='git pull origin $(git_develop_branch)'
alias gp='git push'

# Stash alias
alias gst='git stash'
alias gstp='git stash pop'

# Checkout aliases
alias gch='git checkout'
alias gchm='git checkout $(git_main_branch)'
alias gchd='git checkout $(git_develop_branch)'

# Diff aliases
alias gd='git diff'
alias gds='git diff --staged'

# Logging helpers
alias gls='git log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate'
alias gll='git log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --numstat'
alias gdate='git log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=relative'
alias gdatelong='git log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short'

# Branch helpers
__new_branch() { git checkout -b $1 }
alias gbn=__new_branch

# File searching
search_top_level() {
    A=$(pwd)
    TOPLEVEL=$(git rev-parse --show-toplevel)
    cd $TOPLEVEL
    MY_RESULT="$(git grep --full-name -In $1)"
    py_script="
search_string = \"$1\"
bash = \"\"\"$MY_RESULT\"\"\"
CSI='\x1B['
reset = CSI + 'm'
bash = bash.replace(search_string, CSI + '91;40m' + search_string + reset)
bash_split = ['File Name:#:Result'] + bash.split('\n')
name_len = 0
line_len = 0
for line in bash_split:
    this_line = line.split(':')
    temp_name = this_line[0]
    temp_line = this_line[1]
    name_len = max(len(temp_name), name_len)
    line_len = max(len(temp_line), line_len)

to_print = '{0:<%d} | {1:>%d} | {2}' % (name_len, line_len)
for line in bash_split:
    this_line = line.split(':')
    temp_name = this_line[0]
    temp_line = this_line[1]
    print(to_print.format(temp_name, temp_line, ' '.join(this_line[2:])))
"
python3 -c "$py_script"
cd $A
}

alias gsearch=search_top_level
alias gfind='git ls-files | grep -i'

# Check if main exists and use instead of master
function git_main_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local ref
  for ref in refs/{heads,remotes/{origin,upstream}}/{main,trunk}; do
    if command git show-ref -q --verify $ref; then
      echo ${ref:t}
      return
    fi
  done
  echo master
}

# Check for develop and similarly named branches
function git_develop_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local branch
  for branch in dev devel development; do
    if command git show-ref -q --verify refs/heads/$branch; then
      echo $branch
      return
    fi
  done
  echo develop
}