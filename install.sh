#!/bin/sh

#git clone git@gitlab.com:summit.bhalla/dotfiles.git ~/.dotfiles
echo '========================'
echo 'Updating Package Manager and Pre-Requisites'
echo '========================'
sudo apt-get update
sudo apt-get install -y vim git stow zsh tmux
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#sudo ~/.dotfiles/pwrfonts/install.sh
sudo locale-gen "en_US.UTF-8"
sudo dpkg-reconfigure locales

echo '========================'
echo 'Installing oh my zsh'
echo '========================'
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s $(which zsh)

echo '========================'
echo 'Clone dotfiles and link them'
echo '========================'
cd ~/.dotfiles
stow vim
stow git
#stow zsh
echo '========================'
echo 'Install Vim Plugins'
echo '========================'
vim +PluginInstall +qall
