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
  "$HOME/bin/google-cloud-sdk/bin"(N-/)
  "$HOME/.local/bin"(N-/)
  "$HOME/Library/Application Support/JetBrains/Toolbox/scripts"(N-/)
  "$HOME/.cargo/bin"(N-/)
  "$GOPATH/bin"(N-/)
  "$VOLTA_HOME/bin"(N-/)
  "${ASDF_DATA_DIR:-$HOME/.asdf}/shims"(N-/)
  "/opt/homebrew/opt/php@7.4/bin"(N-/)
  "/opt/homebrew/opt/php@7.4/sbin"(N-/)
  "/usr/local/bin"
  "/opt/homebrew/bin"
  "/opt/homebrew/opt/mysql-client/bin"(N-/)
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
  alias vim='nvim'
  export LESS='-R -X'

  setopt correct
  setopt no_beep
  setopt nolistbeep
  # 途中のシャープをコメントアウトとして扱う
  setopt interactive_comments
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

    # Cargo
    if [[ ! -L $(brew --prefix)/share/zsh/site-functions/_cargo && -f "$HOME/.rustup/toolchains/stable-aarch64-apple-darwin/share/zsh/site-functions/_cargo" ]]; then
        ln -s "$HOME/.rustup/toolchains/stable-aarch64-apple-darwin/share/zsh/site-functions/_cargo" "$(brew --prefix)/share/zsh/site-functions/_cargo"
    fi

    # uv
    # https://github.com/astral-sh/uv/issues/8432#issuecomment-2453494736
    eval "$(uv generate-shell-completion zsh)"
    _uv_run_mod() {
        if [[ "$words[2]" == "run" && "$words[CURRENT]" != -* ]]; then
            _arguments '*:filename:_files'
        else
            _uv "$@"
        fi
    }
    compdef _uv_run_mod uv
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
