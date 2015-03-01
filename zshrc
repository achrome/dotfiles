echo "Loading shell config"
### ZSH Configuration
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ys"
export UPDATE_ZSH_DAYS=6
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd/mm/yyyy"
plugins=(git git-extras common-aliases command-not-found rand-quote)
source $ZSH/oh-my-zsh.sh

### Environment variables
export PATH="$PATH:$HOME/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:$HOME/.rvm/bin"
export LANG=en_IN.UTF-8
export GOROOT=/usr/local/go
export GOPATH=/var/code/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
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

### Random quote
quote
