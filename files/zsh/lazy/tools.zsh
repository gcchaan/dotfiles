# [Homebrew]coreutils
case "$OSTYPE" in
    darwin*)
        (( ${+commands[gdate]} )) && alias date='gdate'
        (( ${+commands[gls]} )) && alias ls='gls'
        (( ${+commands[gmkdir]} )) && alias mkdir='gmkdir'
        (( ${+commands[gcp]} )) && alias cp='gcp'
        (( ${+commands[gmv]} )) && alias mv='gmv'
        (( ${+commands[grm]} )) && alias rm='grm'
        (( ${+commands[gdu]} )) && alias du='gdu'
        (( ${+commands[ghead]} )) && alias head='ghead'
        (( ${+commands[gtail]} )) && alias tail='gtail'
        (( ${+commands[gdirname]} )) && alias dirname='gdirname'
        (( ${+commands[gxargs]} )) && alias xargs='gxargs'
    ;;
esac
# [Homebrew]gnu-sed
(( ${+commands[gsed]} )) && alias sed='gsed'
# [Homebrew]grep
(( ${+commands[ggrep]} )) && alias grep='ggrep'
# [Homebrew]findutils
(( ${+commands[gfind]} )) && alias find='gfind'

# [Homebrew]direnv
eval "$(direnv hook zsh)"

# [Homebrew]eza
alias ll='eza -l'
alias la='eza -la'
function etree (){
    local DEPTH=${1:-2}
    eza -TL "${DEPTH}"
}

# [Homebrew]bat
export BAT_THEME='Dracula'
export PAGER=bat
alias less='bat'

# [Homebrew]delta
alias diff='delta'

# [Homebrew] zoxide
eval "$(zoxide init zsh --no-cmd)"
z() {
  __zoxide_z "$@"
}
zi() {
  local target
  # Combine zoxide history and ghq list, remove duplicates, and pipe to fzf
  target=$( (zoxide query --list; ghq list -p) | awk '!a[$0]++' | fzf --height 40% --reverse --query="$*")

  # If a directory is selected, cd into it (triggering zoxide's hook)
  if [[ -n "$target" ]]; then
    cd "$target"
  fi
}

# [Homebrew]volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mba2022/bin/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mba2022/bin/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/mba2022/bin/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mba2022/bin/google-cloud-sdk/completion.zsh.inc'; fi

alias pstorm='phpstorm'
