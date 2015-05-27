echo "Loading shell config"

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

  ### Text Editor
  atom

  ### Utils
  wd
  extract
  urltools
  httpie

  rand-quote
  zsh-users/zsh-completions src
  zsh-users/zsh-syntax-highlighting zsh-syntax-highlighting.zsh
  voronkovich/gitignore.plugin.zsh
  marzocchi/zsh-notify
  ascii-soup/zsh-url-highlighter url/url-highlighter.zsh
  joel-porquet/zsh-dircolors-solarized
  tarrasch/zsh-colors
  willghatch/zsh-snippets
EOBUNDLES
antigen apply

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
export PATH="$HOME/.pyenv/bin:$PATH"

### Version Managers
[[ -s "$HOME/.gvm/bin/gvm-init.sh" ]] && source "$HOME/.gvm/bin/gvm-init.sh"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

### ls fix
eval `dircolors $HOME/.dircolors`

### Misc aliases
alias git=hub
alias reload="source $HOME/.zshrc"
eval alias npm-exec="PATH=$(npm bin):$PATH"

### OPAM
. /home/achrome/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

### Use default versions from different VMs
rvm use default
nvm use default
gvm use gradle
pyenv shell system

### System information
uname -a
apache2 -v
gcc --version
g++ --version
ghc --version
git --version
go version
java -version
mongo --version
mysql --version
php -v
python --version
redis-cli --version
redis-server --version
rethinkdb --version
ruby -v
rustc --version
echo "Shell config loaded. Greetings $USER"

quote
