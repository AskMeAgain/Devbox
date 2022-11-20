#!/bin/sh -e

echo "--- turning sudo off ---"
echo "1234" | sudo -S sh -c 'echo "dev ALL=(ALL:ALL) NOPASSWD: ALL" | tee /etc/sudoers.d/dont-prompt-for-sudo-password'

echo "--- installing yay ---"
sudo pacman-key --init --noconfirm
sudo pacman -S glibc lib32-glibc yay --noconfirm

echo "--- yay setups ---"
yay --save --answerclean All
yay --save --answerdiff None

echo "--- installing yadm ---"
yay -S yadm-git --noprovides

echo "--- cloning provided repo ---"
yadm clone $2 -f --bootstrap

echo "--- mounting shared folder ---"
mkdir ~/shared
sudo mount -t vboxsf shared ~/shared
echo "shared	/home/$3/shared	vboxsf	defaults	0	0" | sudo tee /etc/fstab
echo "vboxsf" | sudo tee /etc/modules

echo "--- turning sudo on ---"
echo "1234" | sudo -S rm -f /etc/sudoers.d/dont-prompt-for-sudo-password