#!/bin/bash

echo $1 | sudo -S pacman-mirrors --fasttrack 5 && sudo pacman -Syu --noconfirm