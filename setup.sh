#!/usr/bin/env zsh

source resources.sh
source linux.sh


bot "hello! welcome to your new computer"
bot "let's get going! "

# install linux pkgs
export GOPATH=$HOME
mkdir -p $GOPATH/src $GOPATH/pkg $GOPATH/bin

# setup rbenv & install ruby
 RUBY_VERSION=2.7.0
 echo "🦄  ruby" $RUBY_VERSION
 running "rbenv install ruby:$RUBY_VERSION"
 rbenv install -s $RUBY_VERSION
 rbenv global $RUBY_VERSION
 ok rbenv

running "npm settings"
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
ok npm-settings

running "downloading oh-my-zsh"
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
ok oh-my-zsh

running "installing zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions.git \
  ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
ok

running "installing zsh-history-substring-search"
git clone https://github.com/zsh-users/zsh-history-substring-search \
  ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search
ok

running "installing zsh-fast-syntax-highlighting"
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting \
  ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting
ok

running "installing zsh-you-should-use"
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git \
  ~/.oh-my-zsh/custom/plugins/you-should-use
ok

running "installing zsh-plugins-autoupdate"
git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins.git \
  ~/.oh-my-zsh/custom/plugins/autoupdate
ok

bot "setting zsh as the user shell"
chsh -s $(which zsh)

running "sourcing zshrc"
source ~/.zshrc
ok

