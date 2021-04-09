#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

export ZSH="/Users/kt/.oh-my-zsh"
export GOPATH=$HOME
export GO111MODULE=on
export GOPRIVATE="github.com/Shopify/*"

export PATH="$HOME/.bin:$PATH"
export PATH="/Applications/chktex-1.6.4/chktex:$PATH"
export PATH=/usr/local/bin:$PATH
export PATH="$GOPATH/bin:$PATH"
export PATH="${PATH}:${HOME}/.krew/bin"

# recommended by brew doctor
export PATH="/usr/local/bin:$PATH"

export EDITOR=vim
export DOCKER_BUILDKIT=1

# shellcheck disable=SC2034
ZSH_THEME="agnoster"
export UPDATE_ZSH_DAYS=5

# shellcheck disable=SC2034
plugins=(
  autojump
  autoupdate
  colorize
  colored-man-pages
  docker
  fast-syntax-highlighting
  git
  history-substring-search
  vscode
  you-should-use
  zsh-autosuggestions
)

# shellcheck disable=SC1090
source $ZSH/oh-my-zsh.sh

# Import Aliases
if [ -f ~/.aliases ]; then
  source ~/.aliases
else
  print "404: ~/.aliases not found."
fi

# Source
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

# shellcheck disable=SC1091
if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc' ]; then
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc';
fi

# shellcheck disable=SC1091
if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc' ]; then
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc';
fi

# cloudplatform: add Shopify clusters to your local kubernetes config
export KUBECONFIG=/Users/kt/.kube/config:/Users/kt/.kube/config.shopify.cloudplatform

for file in /Users/kt/src/github.com/karanthukral/dotify/dotfiles/*.bash; do source ${file}; done
kubectl-short-aliases

if [ -e /Users/kt/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/kt/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
autoload -U +X bashcompinit && bashcompinit
