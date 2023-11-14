export PATH="$PATH:$HOME/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:$HOME/.local/bin:$HOME/.govm/bin:$HOME/.cargo/bin"
export LANG=en_IN.UTF-8
export GOPATH=$HOME/code/go
export GHCVERSION=head
export CABALVERSION=head
export GHCPATH=/opt/ghc/$GHCVERSION/bin:/opt/cabal/$CABALVERSION/bin
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin:$GHCPATH
export VISUAL=nvim

### Font development kit
export FDK_EXE="$HOME/bin/FDK/Tools/linux"
export PATH="$PATH:$FDK_EXE"
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'

### FZF
export FZF_DEFAULT_COMMAND="fd --type file --follow --hidden --exclude .git --color=always"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--ansi"

export LANG=en_IN.UTF-8
export LC_CTYPE=en_IN.UTF-8
