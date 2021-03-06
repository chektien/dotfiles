#!/bin/bash

# config tmux
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

# config git
git config --global user.email "chek@gamesstudio.org"
git config --global user.name "chektien"
git config --global core.editor "vim"
ln -s ~/dotfiles/ssh-config/config ~/.ssh/config

# ssh-keygen and copy pub key to github
git clone git@github.com:chektien/dotfiles.git

# install some essentials
# - mosh server for nicer connectivity to ssh 
# - arp-scan to scan all other devices in the LAN
sudo apt install vim-gtk mosh tmux autojump cmake zsh openconnect dnsmasq arp-scan

# vim
sudo apt install ncurses-dev
git clone https://github.com/vim/vim.git
./configure --with-features=huge \
    --enable-multibyte \
    --enable-rubyinterp=yes \
    --enable-python3interp=yes \
    --with-python3-config-dir=$(python3-config --configdir) \
    --enable-perlinterp=yes \
    --enable-luainterp=yes \
    --enable-gui=auto \
    --enable-gtk2-check \
    --enable-cscope \
    --prefix=/usr/local
sudo make install

# neovim
sudo apt install snapd
sudo snap install nvim --classic

# clangd for coc-nvim
sudo apt install clang # somehow need to manually install deps first
sudo apt install clangd-9

# link up .vimrc
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/coc-settings.json ~/.vim/coc-settings.json
. ~/.vimrc
 
# link up neovim config
mkdir -p .config/nvim
ln -s ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
. ~/.config/nvim/init.vim

# link up .zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
. ~/.zshrc

# install providers for languages in neovim
pip install pynvim

# powerline fonts
pip install --user git+git://github.com/Lokaltog/powerline --verbose

# install oh my zsh for easy theming
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# download powerlevel10k theme
# ~/dotfiles/.zshrc should have added ZSH_THEME="powerlevel10k/powerlevel10k"
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# download gruvbox theme
curl -L https://raw.githubusercontent.com/sbugzu/gruvbox-zsh/master/gruvbox.zsh-theme > ~/.oh-my-zsh/custom/themes/gruvbox.zsh-theme

# download zsh plugins
# ~/dotfiles/.zshrc should have added 
# plugins=(git zsh-autosuggestions autojump zsh-syntax-highlighting)
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# install vim plug
# after that need to run PlugInstall in a new vim session
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install AWS CLi out of any venv
# https://ownthe.cloud/posts/configure-aws-cli-on-raspberry-pi/
# add to rc files export PATH=/home/pi/.local/bin:$PATH
pip install awscli

# network-manager-gnome for desktop wifi management
#sudo apt install network-manager network-manager-gnome

# latex, and note texlive-full is 5gb
sudo apt install texlive-full latexmk libsynctex-dev xdotool zathura

# install samba server to become NAS
# e.g., allow smb://10.1.1.1 etc to serve files
# input a password for samba username pi
# may want to ln up the smb.conf into /etc/samba/smb.conf
sudo apt install samba samba-common-bin
sudo smbpasswd -a pi
sudo systemctl restart smbd

# install tiger vnc: built on top of tightvnc
# realvnc only plays well with it's own viewer but ipad is using screens
# start vncserver with the command below
# vncserver :1 -geometry 1398x1024 -depth 32 -localhost no
sudo apt install tigervnc-standalone-server
echo "@reboot su - pi -c '/usr/bin/vncserver -geometry 1366x1024 -depth 32 -localhost no'" >> addcron
crontab addcron
rm addcron
vncpasswd

# alternative simpler vnc: install tightvncserver
#sudo apt install tightvncserver
#echo "@reboot su - pi -c '/usr/bin/tightvncserver -geometry 1366x1024'" >> addcron
#crontab addcron
#rm addcron

