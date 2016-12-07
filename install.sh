#!/bin/sh

echo 'Updating Package Manager and Pre-Requisites'
echo '========================'
sudo apt-get update
sudo apt-get install -y vim git stow
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo '========================'
echo 'Installing oh my zsh'
echo '========================'
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

echo '========================'
echo 'Clone dotfiles and link them'
echo '========================'
git clone https://github.com/aum12/dotfiles.git ~/.dotfiles

stow vim
stow
vim +PluginInstall +qall

