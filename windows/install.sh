#!/bin/sh

sudo apt-get update
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo add-apt-repository ppa:pi-rho/dev
sudo apt-get update

sudo apt-get install -y git
ln -sf ~/dotfiles/git/gitconfig ~/.gitconfig
mkdir -p ~/github

sudo apt-get install -y subversion

sudo apt-get install -y neovim
sudo apt-get install -y python-dev python-pip python3-dev python3-pip
sudo pip3 install neovim jedi mistune psutil setproctitle
mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/vim/.tern-project ~/.tern-project
ln -sf ~/dotfiles/vim/init.vim ~/.config/nvim/init.vim
if [ ! -d ~/.config/nvim/after ]; then
  ln -sf ~/dotfiles/vim/after ~/.config/nvim/after
fi

sudo apt-get install -y --force-yes tmux-next
ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
