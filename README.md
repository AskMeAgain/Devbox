# Devbox

Devbox is a project where you can create a complete programming environment with i3 and Manjaro in VirtualBox. Customization is possible by changing the settings.json file and providing another git repository with different setup/dotfiles.
Currently only i3 is supposed and i guess this will be the end of it too. 
Iam open for any pullrequests if you would like to add another base image.

## Dependencies

Packer from HashiCorp needs to be installed and available via PATH. VirtualBox from Oracle is also needed (iam using 6.12 currently).

## Installation

Pull this repository, then edit the settings.json file as you wish and provide a compatible git repo with setup file and dotfiles.
Execute create-vm.bat and everything will happen automatically. After everything is done, startup virtual box and the vm will be ready as specified by the provided git repo

## Make your own setup compatible with Devbox

The dotfiles will be installed by yadm, so please provide a compatible structure in your repo. 
This project **expects** a ~/.config/yadm/bootstrap file which will be execute by yadm later for setting up the vm. Make sure to provide one, even if its empty.
The root password is 1234, make sure that you change it after your setup is done.

You can orient yourself at this repo here (https://github.com/AskMeAgain/orchid.git). 

## Compatible themes

Here is a list with compatible git repos, where you can just switch out the git repo link in the settings.json file and it will work straight out of the box.

* https://github.com/AskMeAgain/orchid.git (light theme by me)

## Two Step Installation

Packer will first download the i3 manjaro iso file and will also install i3 for you (english keyboard, english OS).

After the base image is done, another packer script will install all the needed dependencies using the base image to create a new vm.

The installation happens in two steps (first base image, then another image will be created where the provided git repo will be installed upon).
This allows you to quickly build if you changed the settings and want to try out different dotfiles.
