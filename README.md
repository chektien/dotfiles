# Installation from SDcard Flash
## headless setup
https://desertbot.io/blog/headless-raspberry-pi-4-ssh-wifi-setup

Create `<root>/wpa-supplicant.conf` in sdcard
Then create ssh file in `<root>` 
`touch ssh`

If network-manager is installed, everything will be overridden.
After disabling network-manager, need to
1. add `name_servers=8.8.8.8` to `/etc/resolveconf.conf`
2. 


## config to use raspi usb-c as an ethernet device
https://www.hardill.me.uk/wordpress/2019/11/02/pi4-usb-c-gadget/

## ssh into rpi
ssh-keygen -R raspberrypi.local  (this will error if never login before, idea is to clear out old)
ssh pi@raspberrypi.local

1st login default:
`password: raspberry`

# TODO full config for new pi after ssh

## git pull from all repos

## linking up the dotfiles

### console
- `ln -s ~/dotfiles/.vimrc ~/.vimrc`
- `ln -s ~/dotfiles/.zshrc ~/.zshrc`

### in vim
- `PlugClean`
- `PlugInstall`

# git

Need to place *config* file in `~/.ssh`

If you're on a wifi that blocks ssh ports and don't wanna switch to https, then put the following inthe file `~/.ssh/config`
```
Host github.com
  Hostname ssh.github.com
  Port 443
  User git
  #IdentityFile ~/path/to/key
```

# Install zsh

Then shift the *.zshc* into `~/`. 
Use *agnostic* theme to get the fancy formatting in terminal.
Use *power10k* for the ultimate fanciness.
This requires powerline fonts and symbols. 

# LaTeX

Need to find where the following file lies...
~/.latexmkrc

```
$pdf_previewer = "start okular %O %S";
$pdf_update_method = 4;

$pdf_previewer = "start xpdf -remote %R %O %S";
$pdf_update_method = 4;
$pdf_update_command = "xpdf -remote %R -reload";

$dvi_previewer = 'start xdvi -watchfile 1.5';
$ps_previewer  = 'start gv --watch';
$pdf_previewer = 'start evince';

$pdf_previewer = "start okular %O %S";
$pdf_update_method = 4;
```

# Power management 

To possibly get better ssh perf over wifi
`sudo vim /etc/network/if-up.d/wlan0`

Then add 
`ifconfig wlan0 power off`

# Hardware settings

`sudo raspi-config`
- enable SPI interface for GPIO access
- enable camera interface

# VNC in raspbian

## built-in
`sudo raspi-config`
and turn on the VNC setting in there

## if need to manually install
`sudo apt-get update`
`sudo apt-get install real-vnc-server`

## set the resolution
in the /root/config.txt comment out below to get full resolution in
`dtoverlay=vc4-kms-v3d`

# AWS configuration
## set AWS boliao user credentials
`aws configure`
and key in the ID and Secret from AWS

# Jupyter
```
ln -s ~/dotfiles/jupyter-config ~/.jupyter
ln -s ~/dotfiles/zathura-config ~/.config/zathura 
```

