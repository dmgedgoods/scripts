#!/bin/bash

sudo apt update && sudo apt upgrade -y

sudo apt-get install -y curl zsh git gh gcc python3.10-venv pip openjdk-18-jre openjdk-18-jdk

sudo wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo tar -zxvf nvim-linux64.tar.gz -C /opt/
sudo ln -s /opt/nvim-linux64/bin/nvim /usr/bin/nvim
sudo rm nvim-linux64.tar.gz

sudo wget https://nodejs.org/dist/v18.17.1/node-v18.17.1-linux-x64.tar.xz
sudo tar -xvf node-v18.17.1-linux-x64.tar.xz -C /opt/
sudo ln -s /opt/node-v18.17.1-linux-x64/bin/node /usr/bin/node
sudo ln -s /opt/node-v18.17.1-linux-x64/bin/npm /usr/bin/npm
sudo ln -s /opt/node-v18.17.1-linux-x64/bin/npx /usr/bin/npx
sudo rm node-v18.17.1-linux-x64.tar.xz

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

git clone https://github.com/dmgedgoods/dotfiles.git
mkdir -p ~/.config
ln -s ~/dotfiles/.config/nvim ~/.config
ln -s ~/dotfiles/.config/tmux ~/.config
nvim  #fix for :so and :PackerSync after initial install

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
