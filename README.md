# Devbox

Devbox is a project where you can provision a complete programming environment with Manjaro, fully automated in VirtualBox. Customization is possible by changing the settings.json file and providing another git repository with different setup/dotfiles.
Currently only manjaro i3 version is supported.

Iam open for any pullrequests if you would like to add another base image.

## Dependencies

VirtualBox from Oracle is needed. Packer is downloaded automatically via script.

## Installation

Pull this repository, then edit the settings.json file as you wish and provide a compatible git repo with setup file and dotfiles.
Execute create-vm.bat and everything will happen automatically. After everything is done, startup virtual box and the vm will be ready as specified by the provided git repo

## Make your own setup compatible with Devbox

The devbox provisioning **installs yadm, ansible and the aur helper** automatically.

You can use your yadm setup to install missing dependencies via ansible.

The dotfiles will be installed by [yadm](https://yadm.io/), so please provide a compatible structure in your repo. 

## Compatible themes

Here is a list with compatible git repos, where its possible to switch out the dotfiles and you can expect fully compatibility.

* https://github.com/AskMeAgain/orchid.git

### What is happening in this repo?

Packer will be downloaded automatically if it doesnt exist. Then packer will first download the i3 manjaro iso file and will install i3 for you
via key presses (english keyboard, english OS).

It will then select a good mirror, update all packages and install ansible/ansible aur helper/ + yadm

It will then pull in the git dotfiles and run the bootstrap file via ansible itself.

