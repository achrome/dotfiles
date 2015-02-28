echo "Loading shell config"
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ys"
export UPDATE_ZSH_DAYS=6
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd/mm/yyyy"
plugins=(git debian git-extras common-aliases tmuxinator tmux sudo)
source $ZSH/oh-my-zsh.sh
export PATH="$PATH:$HOME/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:$HOME/.rvm/bin"
export LANG=en_IN.UTF-8
[[ -s "$HOME/.gvm/bin/gvm-init.sh" ]] && source "$HOME/.gvm/bin/gvm-init.sh"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export apt_pref="apt-get"
uname -a
rvm use default
export TERM=xterm-256color
eval `dircolors $HOME/.dircolors`
eval alias git=hub
eval alias npm-exec="PATH=$(npm bin):$PATH"
export GOROOT=/usr/local/go
export GOPATH=/var/code/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
ruby -v
nvm use default
apache2 -v
gcc --version
java -version
php -v
gvm use gradle
mysql --version
mongo --version
git --version
go version
rustc --version
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv global system
python --version
echo "Shell config loaded. Greetings $USER"
