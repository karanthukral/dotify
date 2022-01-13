#!/usr/bin/env zsh

source resources.sh


function install_docker() {
  bot "install docker dependencies"
  apt install ca-certificates curl gnupg lsb-release

  bot "add docker GPG key"
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

  bot "add docker stable repo"
  echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  bot "install docker"
  apt update && apt install -y docker-ce docker-ce-cli containerd.io
}

function install_kubectl() {
  curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
  echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
  apt update && apt install -y kubectl
}


function install_go() {
  bot "wget go"
  wget "https://go.dev/dl/go1.17.6.linux-amd64.tar.gz"

  bot "tar"
  rm -rf /usr/local/go && tar -C /usr/local -xzf "go1.17.6.linux-amd64.tar.gz"

  bot "remove tar file"
  rm -rf "go1.17.6.linux-amd64.tar.gz"
}

function install_pkgs() {
  bot "Run apt update"
  apt update && apt upgrade -y
  ok "apt-update"

  bot "Install zsh"
  apt install -y zsh
  ok "zsh"

  bot "Install go"
  install_go
  ok "go"

  bot "Install rbenv"
  apt install -y rbenv
  ok "rbenv"

  bot "Install Python"
  apt install -y python
  ok "python"

  bot "Install npm"
  apt install -y npm
  ok "npm"

  bot "Install yarn"
  npm install -g yarn
  ok "yarn"

  bot "Install nvm"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
  ok "nvm"

  bot "Install docker"
  install_docker
  ok "docker"

  bot "Install kubectl"
  install_kubectl
  ok "kubectl"

  bot "Install kube_ps1"
  install_kube_ps1
  ok "kube_ps1"

  bot "Install diff-so-empty"
  npm install -g diff-so-fancy
  ok "diff-so-empty"

  bot "Install mosh"
  apt install -y mosh
  ok "mosh"
}

function install_kube_ps1(){
  bot "install kube_ps1"
  git clone https://github.com/jonmosco/kube-ps1.git ~/.kube_ps1
}
