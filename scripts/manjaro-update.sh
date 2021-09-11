#!/bin/bash

echo $1 | sudo -S pacman-mirrors --fasttrack 5 
sleep 5
echo $1 | sudo -S rm /var/lib/pacman/db.lck
echo $1 | sudo -S pacman -Syu --noconfirm