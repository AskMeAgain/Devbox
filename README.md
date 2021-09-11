# Devbox

Devbox is a project where you can provision a complete programming environment with i3 and Manjaro, fully automated in VirtualBox. Customization is possible by changing the settings.json file and providing another git repository with different setup/dotfiles.
Currently only i3 is supported and i guess this will be the end of it too as i3 is good enough.

Iam open for any pullrequests if you would like to add another base image.

## Dependencies

VirtualBox from Oracle is needed. Packer is downloaded automatically via script.

## Installation

Pull this repository, then edit the settings.json file as you wish and provide a compatible git repo with setup file and dotfiles.
Execute create-vm.bat and everything will happen automatically. After everything is done, startup virtual box and the vm will be ready as specified by the provided git repo

## Make your own setup compatible with Devbox

The dotfiles will be installed by yadm, so please provide a compatible structure in your repo. 
This project **expects** a ~/.config/yadm/bootstrap file which will be execute by yadm later to setup the vm. Make sure to provide one, even if its empty.
The root password is 1234, make sure that you change it after your setup is done.

## Compatible themes

Here is a list with compatible git repos, where its possible to switch out the dotfiles and you can expect fully compatibility.

* https://github.com/AskMeAgain/orchid.git

### What is happening in this repo?

Packer will be downloaded automatically. Then packer will first download the i3 manjaro iso file and will install i3 for you (english keyboard, english OS).

After the base image is done, another packer script will update the manjaro dependencies and mounts a **shared folder**. Inside the VM you can reach it on ~/shared

After the updating step, another image is created which runs a bootstrap file via yadm provided by the git repo url via settings.json.

The installation happens in 3 steps (first base image, then updated image, then another image will be created where the provided git repo will be installed upon).
This allows you to quickly iterate on the same base file.
