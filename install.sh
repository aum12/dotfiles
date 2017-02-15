#!/bin/sh

#git clone git@gitlab.com:summit.bhalla/dotfiles.git ~/.dotfiles
echo '========================'
echo 'Updating Package Manager and Pre-Requisites'
echo '========================'
#add repo that can get latest (daily) version of vim; for autocomplete support
sudo apt-get install -y software-properties-common python-software-properties
sudo add-apt-repository ppa:pkg-vim/vim-daily
sudo apt-get update
sudo apt-get install -y vim git stow zsh tmux python-flake8 python-autopep8
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

sudo locale-gen "en_US.UTF-8"
sudo dpkg-reconfigure locales

echo '========================'
echo 'Installing oh my zsh'
echo '========================'
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s $(which zsh)
