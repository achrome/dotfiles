echo "\e[1;4;33m\x0aLoading shell configuration\e[0m\n"

### Antigen Configuration
source $HOME/dotfiles/antigen/antigen.zsh
antigen use oh-my-zsh
antigen theme ys
antigen bundles <<EOBUNDLES
  ### Ruby
  ruby
  gem

  ### Node
  node
  npm

  ### Python
  python
  pyenv
  pip

  ### Git
  gitfast
  git-extras

  ### Dev-ops
  docker
  vagrant

  ### Utils
  wd
  extract
  urltools
  httpie

  rand-quote
  zsh-users/zsh-completions src
  zsh-users/zsh-syntax-highlighting zsh-syntax-highlighting.zsh
  voronkovich/gitignore.plugin.zsh
  unixorn/docker-helpers.zshplugin
  marzocchi/zsh-notify
  ascii-soup/zsh-url-highlighter url/url-highlighter.zsh
  joel-porquet/zsh-dircolors-solarized zsh-dircolors-solarized.zsh
  tarrasch/zsh-colors
  willghatch/zsh-snippets
EOBUNDLES
antigen apply
echo "\e[32mAntigen \u2714\e[0m"

### Environment variables
export PATH="$PATH:$HOME/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:$HOME/.rvm/bin"
export LANG=en_IN.UTF-8
export GOROOT=/usr/local/go
export GOPATH=/var/code/go
export GHCVERSION=7.10.2
export CABALVERSION=1.22
export GHCPATH=/opt/ghc/$GHCVERSION/bin:/opt/cabal/$CABALVERSION/bin
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:$GHCPATH
export TERM=xterm-256color
export NVM_DIR="$HOME/.nvm"
export WORKON_HOME="$HOME/.virtualenvs"
export PATH="$HOME/.pyenv/bin:$PATH"
echo "\e[32mPath variables \u2714\e[0m"

### Version Managers
export SDKMAN_DIR="$HOME/.sdkman" && source "$HOME/.sdkman/bin/sdkman-init.sh"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
### OPAM
. /home/achrome/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
echo "\e[32mVersion managers \u2714\e[0m"

### ls fix
eval `dircolors $HOME/.dircolors`
echo "\e[32mFixed\e[0m \e[33mls colors\e[0m \e[32m\u2714\e[0m"

### Misc aliases
alias git=hub
alias reload="exec $SHELL"
eval alias npm-exec="PATH=$(npm bin):$PATH"
echo "\e[32mAliases \u2714\e[0m"

### Use default versions from different VMs
rvm use default --quiet
nvm use --silent default
sdk use gradle &> /dev/null
sdk use groovy &> /dev/null
pyenv shell system
echo "\e[32mLanguage defaults \u2714\e[0m"

### System information
echo "\n\e[1;4;32mShell configuration \u2713\u2713. Greetings \e[0;1;4;33m$USER.\e[0m\n"
echo "\e[1;35mSystem Details\e[0m\n"
echo "\e[35mOS              :\e[0m $(uname -o)"
echo "\e[35mNode            :\e[0m $(uname -n)"
echo "\e[35mKernel Release  :\e[0m $(uname -r)"
echo "\e[35mKernel Version  :\e[0m $(uname -v)"
echo "\e[35mProcessor       :\e[0m $(uname -o)"
echo "\e[35mShell           :\e[0m $($SHELL --version)"
echo "\n"

echo "\e[1;4;32mLanguages\e[0m\n"
echo "\e[35mErlang      :\e[0m $(cat $(dirname $(dirname `which erl`)/$(readlink `which erl`))/../releases/*/OTP_*)"
echo "\e[35mGCC         :\e[0m $(gcc -dumpversion)"
echo "\e[35mG++         :\e[0m $(g++ -dumpversion)"
echo "\e[35mGolang      :\e[0m $(go version | awk '{ gsub(/go/, ""); print $2 }')"
echo "\e[35mHaskell     :\e[0m $(ghc --numeric-version)"
echo "\e[35mJava        :\e[0m $(java -version 2>&1 | awk 'NR == 1 { gsub(/"/,""); print $3 }')"
echo "\e[35mJulia       :\e[0m $(julia --version | awk '{ print $3 }')"
echo "\e[35mOCamL       :\e[0m $(ocaml -version | awk '{ print $5 }')"
echo "\e[35mPHP         :\e[0m $(php -r 'echo phpversion();' | sed 's/-.*$//g')"
echo "\e[35mPython      :\e[0m $(python -c 'print __import__("platform").python_version()')"
echo "\e[35mRuby        :\e[0m $(ruby -v | awk '{ print $2 }')"
echo "\e[35mRust        :\e[0m $(rustc --version | awk '{ print $2 }')"
echo "\n"

echo "\e[1;4;32mDatabases\e[0m\n"
echo "\e[35mMongo       :\e[0m $(mongo --version | awk '{ print $4 }')"
echo "\e[35mMariaDB     :\e[0m $(mysql --version | awk '{ print $3 }')"
echo "\e[35mRethink     :\e[0m $(rethinkdb --version | awk '{ gsub(/-.*$/, ""); print $2 }')"
echo "\n"

echo "\e[1;4;32mTools\e[0m\n"
echo "\e[35mApache      :\e[0m $(apache2 -v | sed -e '2d' -e 's/^.*\///')"
echo "\e[35mNGinX       :\e[0m $(nginx -v 2>&1 | sed 's/^.*\///')"
echo "\e[35mGit         :\e[0m $(/usr/bin/git --version | sed 's/git version //')"
echo "\e[35mRedis       :\e[0m $(redis-server --version | awk '{ gsub(/v=/, ""); print $3 }')"

echo "\n\e[1;4;32mAnd here's a random quote to get you through this day\e[0m\n"
quote
