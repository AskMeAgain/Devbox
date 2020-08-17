#!/usr/bin/bash -x

#normal update
echo '1234' | sudo -S localectl set-keymap de

#update stuff
sudo pacman-mirrors --fasttrack 5 && sudo pacman -Syyu
sudo pacman -R --noconfirm pcmanfm
sudo pacman -Rd --nodeps --noconfirm picom 
#sudo pacinstall --no-confirm --resolve-conflicts=all --sysupgrade
sudo pacman -S --noconfirm asciidoc uthash gcc meson virtualbox-guest-utils xclip feh firefox ranger rofi docker polybar zsh zsh-completions tilix flameshot

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
git clone https://github.com/ibhagwan/picom-ibhagwan-git

cd picom-ibhagwan-git/ && makepkg && echo '1234' | sudo -S pacman -U *.pkg.tar.xz --noconfirm && cd ..

mkdir ../.config/tilix
mkdir ../.config/ranger/colorschemes
mkdir ../.config/rofi
mkdir ../.config/polybar
mkdir ../.config/picom/
mkdir ../.config/Dharkael/

sudo cp ranger/ranger.desktop /usr/share/applications/ranger.desktop
cp theme/gtk-2.txt theme/gtk-2.new
mv theme/gtk-2.txt ../.gtkrc-2.0
mv theme/gtk3settings.txt ../.config/gtk-3.0/settings.ini
mv shells/zshrc.txt ../.zshrc
mv shells/p10kzsh.txt ../.p10k.zsh
mv i3/i3-config.txt ../.i3/config
mv picom/picom.conf ../.config/picom/picom.conf
mv ranger/commands.py ../.config/ranger/commands.py
mv ranger/rcconf.txt ../.config/ranger/rc.conf
mv ranger/orchid.py ../.config/ranger/colorschemes/orchid.py
mv rofi/config.rasi ../.config/rofi/config.rasi
mv rofi/orchid.rasi ../.config/rofi/orchid.rasi
mv polybar/config ../.config/polybar/config
mv polybar/launch.sh ../.config/polybar/launch.sh
mv tilix/bookmarks.json ../.config/tilix/bookmarks.json
mv flameshot/flameshot.ini ../.config/Dharkael/flameshot.ini

echo 'inode/directory=ranger.desktop' >> ../.config/mimeapps.list
sudo tar -C /usr/share/themes -xvf theme/Orchis-light.tar.xz
sudo usermod --shell $(which zsh) $USER
chsh -s $(which zsh) <<< "1234"
dconf load /com/gexperts/Tilix/ < ./tilix/tilix.dconf

sudo chmod +x ../.config/polybar/launch.sh

#docker
echo '1234' | sudo -S systemctl start docker.service
sudo systemctl enable docker.service
sudo usermod -aG docker $USER


