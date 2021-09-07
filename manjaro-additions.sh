#!/bin/sh -e

echo "--- local to DE ---"
echo "1234" | sudo -S localectl set-keymap de
echo "1234" | sudo -S bash -c 'echo "dev ALL=(ALL:ALL) NOPASSWD: ALL" | (EDITOR="tee -a" visudo)'

echo "--- installing yay ---"
sudo pacman -S yay --noconfirm

echo "--- yay setups ---"
yay --save --answerclean All
yay --save --answerdiff None

echo "--- installing yadm ---"
yay -S yadm-git --noprovides

echo "--- cloning provided repo ---"
yadm clone $2 -f --no-bootstrap
chmod +x ~/.config/yadm/bootstrap

echo "--- executing bootstrap ---"
yadm bootstrap