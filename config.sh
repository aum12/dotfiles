#/bin/sh

echo '========================'
echo 'Link dotfiles'
echo '========================'
cd ~/.dotfiles
stow vim 
stow tmux
stow git
stow dircolors

# Replace default .zshrc file
rm ~/.zshrc
stow zsh
source ~/.zshrc

echo '========================'
echo 'Install Vim Plugins'
echo '========================'
vim +PluginInstall +qall
