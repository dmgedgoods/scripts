#!/bin/bash

sudo apt update && sudo apt upgrade -y

sudo apt-get install -y curl zsh git gh gcc python3.10-venv pip openjdk-18-jre openjdk-18-jdk

cd /opt
sudo wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo tar -zxvf /opt/nvim-linux64.tar.gz
sudo ln -s /opt/nvim-linux64/bin/nvim /usr/bin/nvim

cd /opt
sudo wget https://nodejs.org/dist/v18.17.1/node-v18.17.1-linux-x64.tar.xz
sudo tar -xvf node-v18.17.1-linux-x64.tar.xz
sudo ln -s /opt/node-v18.17.1-linux-x64/bin/node /usr/bin/node
sudo ln -s /opt/node-v18.17.1-linux-x64/bin/npm /usr/bin/npm
sudo ln -s /opt/node-v18.17.1-linux-x64/bin/npx /usr/bin/npx
cd ~/

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

git clone https://github.com/dmgedgoods/dotfiles.git
mkdir -p $HOME/.config/nvim/lua/dmgedgoods && cd "$_"
cp -r $HOME/dotfiles/.config/nvim/lua/dmgedgoods/packer.lua $HOME/.config/nvim/lua/dmgedgoods
nvim -c source $HOME/.config/nvim/lua/dmgedgoods/packer.lua -c PackerSync 

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
