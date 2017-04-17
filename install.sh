#!/bin/sh

#git clone git@gitlab.com:summit.bhalla/dotfiles.git ~/.dotfiles
echo '========================'
echo 'Updating Package Manager and Pre-Requisites'
echo '========================'
#add repo for latest version of vim; for autocomplete support
#add repo for tmux v2.0 install (ubuntu 14.04)
sudo apt-get update
sudo apt-get install -y software-properties-common python-software-properties
sudo add-apt-repository -y ppa:pkg-vim/vim-daily
sudo add-apt-repository -y ppa:pi-rho/dev
sudo apt-get update
sudo apt-get install -y vim git stow zsh tmux python-flake8 python-autopep8 xclip
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

sudo locale-gen "en_US.UTF-8"
sudo dpkg-reconfigure locales

echo '========================'
echo 'Installing oh my zsh'
echo '========================'
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s $(which zsh)
