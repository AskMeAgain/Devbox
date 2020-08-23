#!/bin/bash

echo '1234' | sudo -S localectl set-keymap de

sudo pacman-mirrors --fasttrack 5 && sudo pacman -Syyu --noconfirm
sudo pacman -R --noconfirm pcmanfm
sudo pacman -Rd --nodeps --noconfirm picom 
sudo pacman -S --noconfirm asciidoc uthash gcc meson virtualbox-guest-utils yay xclip feh firefox ranger rofi docker polybar zsh zsh-completions tilix flameshot

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
git clone https://github.com/ibhagwan/picom-ibhagwan-git

cd picom-ibhagwan-git/ && makepkg && echo '1234' | sudo -S pacman -U *.pkg.tar.xz --noconfirm && cd ..

sudo cp ranger/ranger.desktop /usr/share/applications/ranger.desktop

echo 'inode/directory=ranger.desktop' >> ../.config/mimeapps.list
sudo tar -C /usr/share/themes -xvf other/Orchis-light.tar.xz
sudo usermod --shell $(which zsh) $USER
chsh -s $(which zsh) <<< "1234"
dconf load /com/gexperts/Tilix/ < ./other/tilix.dconf

mkdir ../.config/polybar
mv ./other/launch.sh ../.config/polybar/launch.sh
sudo chmod +x ../.config/polybar/launch.sh

#docker
echo '1234' | sudo -S systemctl start docker.service
sudo systemctl enable docker.service
sudo usermod -aG docker $USER

yay --save --answerclean All
yay --save --answerdiff None
echo '1234' | yay -S yadm-git --sudoloop --sudoflags -S

#loading wallpaper
curl $1 > ~/wallpaper.jpg


