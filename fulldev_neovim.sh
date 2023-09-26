#!/bin/bash

# Basic Neovim dev setup. Debian raw install. Edit to your distro.

sudo apt update && sudo apt upgrade -y

sudo apt install -y wget curl tmux tree zsh git tldr fzf unzip gh gcc unzip python3-venv python3-pip default-jdk default-jre 

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

rm -rf ~/.config/nvim && rm -rf ~/.local/share/nvim # Don't nuke the whole config folder
mkdir -p ~/.config # Just in case

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

git clone https://github.com/dmgedgoods/dotfiles.git
ln -s ~/dotfiles/.config/nvim/ ~/.config
ln -s ~/dotfiles/.config/tmux ~/.config
nvim --headless -u NONE ~/.config/nvim/lua/dmgedgoods/packer.lua "+so" "+PackerSync" "+sleep 10" "+qa"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
