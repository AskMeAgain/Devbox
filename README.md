# Devbox

Devbox is a project where you can create a complete programming environment with i3 and Manjaro in VirtualBox. Customization is possible by changing the settings.json file.
Currently only i3 is supposed and i guess this will be the end of it too. 
Iam open for any pullrequests.
## Dependencies

Packer from HashiCorp installed (needs to be available via PATH),  and VirtualBox from Oracle is all you need. 

## Installation

Edit the settings.json file as you wish.
Execute create-vm.bat and everything will happen automatically. After everything is done, startup virtual box and start the vm with your provided name :)

## Setup

The vm will have the following applications installed:

* Ranger
* Tilix
* Picom rounded corner fork by ibhagwan
* polybar
* zsh & powerlevel10k
* flameshot
* rofi
* docker
* feh

## Two Step Installation

Packer will first download the i3 manjaro iso file and guide you through the installation (english keyboard, english OS).

After the base image is done, another packer script will install all the needed dependencies using the base image to create a new vm.

The installation happens in two steps (first base image, then another image will be created with the dependencies).
This allows you quickly build if you change the settings and want to try out different dotfiles.
