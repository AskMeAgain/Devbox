#!/usr/bin/bash

#normal update
echo '1234' | sudo -S localectl set-keymap de
sudo -S pacman -S --noconfirm pacutils unzip
sudo pacinstall --no-confirm --resolve-conflicts=all --sysupgrade

#guest additions
sudo pacman -S --noconfirm virtualbox-guest-utils xclip feh firefox ranger rofi
sudo pacman -R --noconfirm pcmanfm

#zsh & powerlevel10k
sudo pacman -S zsh zsh-completions --noconfirm
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
sudo usermod --shell $(which zsh) $USER
chsh -s $(which zsh) <<< "1234"
mv shells/zshrc.txt ../.zshrc
mv shells/p10kzsh.txt ../.p10k.zsh

#set themes
mv i3/i3-config.txt ../.i3/config
echo "opacity-rule = [" | sudo tee -a /etc/xdg/picom.conf
echo "    \"90:class_g = 'tilix' && focused\"," | sudo tee -a /etc/xdg/picom.conf
echo "    \"60:class_g = 'tilix' && !focused\"" | sudo tee -a /etc/xdg/picom.conf
echo "];" | sudo tee -a /etc/xdg/picom.conf

#install gtk theme
sudo tar -C /usr/share/themes -xvf Orchis-light.tar.xz
cp gtk-2.txt gtk-2.new
mv theme/gtk-2.txt ../.gtkrc-2.0
mv theme/gtk3settings.txt ../.config/gtk-3.0/settings.ini

# so transparency works
sed -i 's/paint/#paint/g' ../.config/compton.conf

#terminal prog tilix
sudo pacman -S tilix --noconfirm || true
dconf load /com/gexperts/Tilix/ < ./tilix/tilix.dconf
mkdir ../.config/tilix
mv tilix/bookmarks.json ../.config/tilix/bookmarks.json

#ranger
mkdir ../.config/ranger/colorschemes
mv ranger/commands.py ../.config/ranger/commands.py
mv ranger/rcconf.txt ../.config/ranger/rc.conf
mv ranger/colorscheme.py ../.config/ranger/colorschemes/orchid.py

#rofi
mkdir ../.config/rofi
mv rofi/config.rasi ../.config/rofi/config.rasi