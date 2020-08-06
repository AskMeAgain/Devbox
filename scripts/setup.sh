#!/usr/bin/bash -x

#normal update
sudo pacman -Syu --noconfirm

#keybinding to DE
sudo localectl set-keymap de

#guest additions
sudo /usr/bin/pacman -S --noconfirm virtualbox-guest-utils

#zsh
sudo pacman -S zsh zsh-completions --noconfirm
curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

sudo usermod --shell $(which zsh) $1

#terminal prog
sudo pacman -S tilix --noconfirm

#firefox
sudo pacman -S firefox --noconfirm

#desktop size
xrandr --output VGA-1 --mode 1920x1080


