#!/usr/bin/bash -x

set -e

#normal update
sudo pacman -S --noconfirm pacutils unzip
sudo pacinstall --no-confirm --resolve-conflicts=all --sysupgrade

#keybinding to DE
sudo localectl set-keymap de

#guest additions
sudo pacman -S --noconfirm virtualbox-guest-utils

#zsh & powerlevel10k
curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
sudo pacman -S zsh zsh-completions --noconfirm
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sudo usermod --shell $(which zsh) $USER

#terminal prog
sudo pacman -S tilix --noconfirm

#firefox
sudo pacman -S firefox --noconfirm

#desktop size
xrandr --output VGA-1 --mode 1360x768

#make clipboard work always
sudo echo 'VBoxClient-all' | sudo tee -a /etc/rc.local 

#download sourcecode font
# curl -L -O https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/SourceCodePro.zip
# unzip -q SourceCodePro.zip -d ./sourceCodefont/
# mv 'Sauce Code Pro Nerd Font Complete.ttf' /usr/share/fonts

#replace i3 config
mv i3-config.txt ../.i3/config