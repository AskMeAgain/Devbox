#!/usr/bin/bash

#normal update
echo '1234' | sudo -S pacman -S --noconfirm pacutils unzip
sudo pacinstall --no-confirm --resolve-conflicts=all --sysupgrade

#guest additions
sudo pacman -S --noconfirm virtualbox-guest-utils xclip

#zsh & powerlevel10k
sudo pacman -S zsh zsh-completions --noconfirm
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
sudo usermod --shell $(which zsh) $USER
chsh -s $(which zsh) <<< "1234"
mv zshrc.txt ../.zshrc
mv p10kzsh.txt ../.p10k.zsh

#replace i3 config
mv i3-config.txt ../.i3/config

#set themes
#sudo pacman -S lxappearance-gtk3 --noconfirm
cp gtk-2.txt gtk-2.new
mv gtk-2.txt ../.gtkrc-2.0.mine
mv gtk-2.new ../.gtkrc-2.0

#firefox
sudo pacman -S firefox --noconfirm

#terminal prog
sudo pacman -S tilix --noconfirm || true
dconf load /com/gexperts/Tilix/ < ./tilix.dconf
mkdir ../.config/tilix
mv bookmarks.json ../.config/tilix/bookmarks.json