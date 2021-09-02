#!/bin/bash

echo $1 | sudo -S pacman-mirrors --fasttrack 5 && sudo pacman -Syyu --noconfirm

echo $1 | sudo -S pacman -S yay --noconfirm

if [ $2 == "none" ]; then
  echo "No git bootstrap specified"
  exit 0;
fi

yay --save --answerclean All
yay --save --answerdiff None

echo $1 | yay -S yadm-git --noprovides --sudoloop --sudoflags -S

yadm clone $2 -f --no-bootstrap

chmod +x ~/.config/yadm/bootstrap

yadm bootstrap