#!/bin/bash

# config git
git config --global user.email "chek@gamesstudio.org"
git config --global user.name "chektien"

# ssh-keygen and copy pub key to github
git clone git@github.com:chektien/dotfiles.git

# install some essentials
# mosh server for nicer connectivity to ssh 
sudo apt install mosh tmux autojump cmake zsh openconnect

# link up .zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc

# powerline fonts
pip install --user git+git://github.com/Lokaltog/powerline --verbose

# install oh my zsh for easy theming
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# download poewrlevel10k theme
# ~/dotfiles/.zshrc should have added ZSH_THEME="powerlevel10k/powerlevel10k"
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# download zsh plugins
# ~/dotfiles/.zshrc should have added 
# plugins=(git zsh-autosuggestions autojump zsh-syntax-highlighting)
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# install 
sudo apt install vim 

# link up .vimrc
ln -s ~/dotfiles/.vimrc ~/.vimrc

# install vim plug
# after that need to run PlugInstall in a new vim session
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install AWS CLi out of any venv
# https://ownthe.cloud/posts/configure-aws-cli-on-raspberry-pi/
pip install awsclipip install awscli

# install tightvncserver
sudo apt install tightvncserver
echo "@reboot su - pi -c '/usr/bin/tightvncserver -geometry 1366x1024'" >> addcron
crontab addcron
rm addcron

# network-manager-gnome for desktop wifi management
#sudo apt install network-manager network-manager-gnome
