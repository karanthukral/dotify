#!/usr/bin/env zsh

source resources.sh

bot "hello! welcome to your new computer"
bot "let's get going! "

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
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git \
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

bot "install kube_ps1"
git clone https://github.com/jonmosco/kube-ps1.git ~/.kube_ps1
ok

SSH_Keygen
bot "Setup complete"

bot "Add the following sshkey to Github at https://github.com/settings/ssh/new"
cat ~/.ssh/id_ed25519.pub
ok
