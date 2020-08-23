# Devbox

Devbox is a project where you can create a complete programming environment with i3 and Manjaro in VirtualBox. Customization is possible by changing the settings.json file and providing another git repository with different setup/dotfiles.
Currently only i3 is supposed and i guess this will be the end of it too. 
Iam open for any pullrequests if you would like to add another base image.

## Dependencies

Packer from HashiCorp needs to be installed and available via PATH. VirtualBox from Oracle is also needed (iam using 6.12 currently).

## Installation

Edit the settings.json file as you wish and provide your own git repository with setup file and dotfiles.
Execute create-vm.bat and everything will happen automatically. After everything is done, startup virtual box and the vm will be ready.

## Make your own setup compatible with Devbox

You can orient yourself at this repo here (https://github.com/AskMeAgain/orchid.git). 

The dotfiles will be installed by yadm, so please provide a similiar structure in your repo.
The repo also should be completly self contained: a setup.sh script which will have the sudo password as $1 and the git repo of itself as $2

## Compatible themes

Here is a list with compatible git repos, where you can just switch out the git repo link in the settings.json file and it will work out of the box

* https://github.com/AskMeAgain/orchid.git (by me)

## Two Step Installation

Packer will first download the i3 manjaro iso file and will also install i3 for you (english keyboard, english OS).

After the base image is done, another packer script will install all the needed dependencies using the base image to create a new vm.

The installation happens in two steps (first base image, then another image will be created where the provided git repo will be installed upon).
This allows you to quickly build if you change the settings and want to try out different dotfiles.
