#!/bin/sh -e

echo "--- turning sudo off ---"
echo "1234" | sudo -S sh -c 'echo "dev ALL=(ALL:ALL) NOPASSWD: ALL" | tee /etc/sudoers.d/dont-prompt-for-sudo-password'

echo "--- local to DE ---"
sudo localectl set-keymap de

echo "--- installing yay ---"
sudo pacman -S yay --noconfirm

echo "--- yay setups ---"
yay --save --answerclean All
yay --save --answerdiff None

echo "--- installing yadm ---"
yay -S yadm-git --noprovides

echo "--- cloning provided repo ---"

yadm clone $2 -f --no-bootstrap

yadm rm --cached -r .
yadm reset --hard

chmod +x ~/.config/yadm/bootstrap

echo "--- executing bootstrap ---"

yadm bootstrap

echo "1234" | sudo -S rm -f /etc/sudoers.d/dont-prompt-for-sudo-password