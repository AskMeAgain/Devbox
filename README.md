# Devbox

Devbox is a project that enables you to automatically set up a comprehensive programming environment within VirtualBox.

EDIT 28-06-2024: This project is archived as it was just to much work keeping it up to date. Unfortunately the manjaro iso is completely incompatible with VB.

Ill link to a new project once ill start working on it. Sorry guys! Was a fun time

## Features

* one click installation
* shared folder into the VM automatically created
* supported OS: Manjaro and Arch

If you have a different base image in mind, your contributions are more than welcome through pull requests.

## Dependencies

VirtualBox from Oracle is needed. [Packer](https://www.packer.io/) is downloaded automatically via script.

## Installation

1. Pull this repository
2. edit settings.json file as you wish
    a. choose a good vm name
    b. if you wish to install Manjaro, choose type "manjaro" (Ready)
    c. if you wisth to install ArchLinux, choose type "arch" (WIP)
    d. if you wish to install NixOs, choose type "nix" (WIP)
3. run create-vm.bat
4. wait 20 minutes
5. start virtual box!

## Make your own setup compatible with Devbox

The provisioning uses [YADM](https://yadm.io/) to install your dotfiles. Provide a bootstrap file to install your needed software. **Ansible is installed on the OS and can be used in the bootstrap file**

## Custom OS

If you want to provide another OS via a pullrequest. Take a look at the installation.json files of each OS. 

## Compatible dotfiles

Here is a list with compatible git repos:

* https://github.com/AskMeAgain/dotfiles.git

### What is happening in this repo?

Packer will be downloaded automatically if it doesnt exist. Then packer will first download the iso file and will install the OS for you
via key presses (english keyboard, english OS).

It will then update all packages and install [ansible](https://www.ansible.com/) + [YADM](https://yadm.io/)

It will then pull in the git dotfiles via yadm and run the bootstrap file of your dotfiles repo via ansible.
