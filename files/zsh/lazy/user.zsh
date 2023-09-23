function select_history() {
    BUFFER=$(builtin history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
    CURSOR=$#BUFFER
}
zle -N select_history
bindkey '^[OA' select_history
bindkey '^r' select_history

function _select_repos() {
    FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} --reverse --height=50%"
    local root="$(ghq root)"
    local repo=$(ghq list | fzf --preview "ghq list --full-path --exact {} | xargs exa -h --long --icons --classify --git --no-permissions --no-user --no-filesize --git-ignore --sort modified --reverse --tree --level 2")
    local dir="${root}/${repo}"
    [ -n "${dir}" ] && cd "${dir}"
    zle accept-line
    zle reset-prompt
}
zle -N _select_repos
bindkey "^g^g" _select_repos

# TODO: PR番号表示したい
function _select_branch() {
    local branches branch
    branches=$(git branch --list --sort=-authordate | grep -v '*')
    branch=$(echo $branches | awk '{print $1}' | fzf +m --preview "git logp -n 50 --color {1}")
    git switch $branch
    zle reset-prompt
}
zle -N _select_branch
bindkey "^g^b" _select_branch

function _select_pr() {
    local pullreq=$(CLICOLOR_FORCE=1 GH_FORCE_TTY=100% gh pr list | tail -n+4 | fzf --ansi --bind "change:reload:CLICOLOR_FORCE=1 GH_FORCE_TTY=100% gh pr list -S {q} | tail -n+4 || true" --disabled --preview "CLICOLOR_FORCE=1 GH_FORCE_TTY=100% gh pr view {1} | bat --color=always --style=grid --file-name a.md")
    if [ -n "$pullreq" ]; then
        local pullreq=$(echo $pullreq | tr -d ' ')
        BUFFER="gh pr checkout \"${pullreq}\""
        zle accept-line
    fi
    zle clear-screen
}
zle -N _select_pr
bindkey "^g^p" _select_pr

function cdgitroot(){
    cd "$(git rev-parse --show-superproject-working-tree --show-toplevel | head -n1)"
}

function zsh_stats() {
    fc -l 1 \
        | awk '{ CMD[$2]++; count++; } END { for (a in CMD) print CMD[a] " " CMD[a]*100/count "% " a }' \
        | grep -v "./" | sort -nr | head -n 20 | column -c3 -s " " -t | nl
}

alias tac='tail -r'

alias relogin='exec $SHELL -l'
alias distinct='awk '\''!a[$0]++'\'
alias slforever='while :;do sl;done'
alias ghql='cd $(ghq list --p|fzf) && basename `pwd` | xargs tmux rename-window'

alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'
