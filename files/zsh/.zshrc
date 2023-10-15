path=(
  '/usr/local/bin'(N-/)
  '/usr/bin'(N-/)
  '/bin'(N-/)
  '/usr/local/sbin'(N-/)
  '/usr/sbin'(N-/)
  '/sbin'(N-/)
)

path=(
  "$HOME/bin"
  "$HOME/.local/bin"(N-/)
  "$CARGO_HOME/bin"(N-/)
  "$GOPATH/bin"(N-/)
  "$HOME/Library/Application Support/JetBrains/Toolbox/scripts"(N-/)
  "/usr/local/bin"
  "/opt/homebrew/bin"
  "$path[@]"
)

eval "$(sheldon source)"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

{
  # tmuxのprefix
  bindkey -r '^S'
  # bindkey -v だと autosuggestionsやabbrと相性がよくないみたい
  bindkey -e
  export EDITOR='nvim'
  alias nano='nvim'
  alias vim'nvim'
  export LESS='-R -X'

  setopt correct
  setopt no_beep
  setopt nolistbeep
}

# cd
{
  setopt auto_pushd
  setopt pushd_ignore_dups
  setopt auto_cd
}

# history
{
  export HISTFILE="$XDG_STATE_HOME/zsh_history"

  HISTSIZE=1000000
  SAVEHIST=1000000

  setopt extended_history
  setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
  setopt hist_ignore_dups       # ignore duplicated commands history list
  setopt hist_ignore_space      # ignore commands that start with space
  setopt share_history          # share command history data
  setopt hist_reduce_blanks
  setopt hist_ignore_all_dups
}

# completion
{
    zstyle ':completion:*:default' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

    # [sheldon]zsh-completions
    if type brew &>/dev/null; then
        FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
    fi
    autoload -Uz compinit && compinit

    # [manual]aws
    if type aws &>/dev/null; then
        autoload -U +X bashcompinit && bashcompinit
        complete -C '/usr/local/bin/aws_completer' aws
    fi

    # [Homebrew]terraform
    if type terraform &>/dev/null; then
        complete -o nospace -C /opt/homebrew/bin/terraform terraform
    fi
}
