export PATH="$PATH:$HOME/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:$HOME/.rvm/bin:$HOME/.local/bin:$HOME/.govm/bin:$HOME/.cargo/bin"
export LANG=en_IN.UTF-8
export GOPATH=$HOME/code/go
export GHCVERSION=head
export CABALVERSION=head
export GHCPATH=/opt/ghc/$GHCVERSION/bin:/opt/cabal/$CABALVERSION/bin
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin:$GHCPATH
export NVM_DIR="$HOME/.nvm"
export WORKON_HOME="$HOME/.virtualenvs"
export PATH="$HOME/.pyenv/bin:$HOME/.govm/versions/current/bin:$PATH"
export VISUAL=vim

### Font development kit
export FDK_EXE="$HOME/bin/FDK/Tools/linux"
export PATH="$PATH:$FDK_EXE"
export ZSH_AUTOSUGGEST_STRATEGY=match_prev_cmd
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'

### FZF
export FZF_DEFAULT_COMMAND="fd --type file --follow --hidden --exclude .git --color=always"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--ansi"
