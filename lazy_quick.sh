#!/bin/bash
set -e

## After everything is done, source packer.lua, :PackerSync and you should be g2g

sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install -y curl zsh gh git gcc build-essential ripgrep python3.10-venv pip openjdk-18-jre openjdk-18-jdk

cd /opt
sudo wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo tar -zxvf /opt/nvim-linux64.tar.gz
sudo ln -s /opt/nvim-linux64/bin/nvim /usr/bin/nvim
sudo rm /opt/nvim-linux64.tar.gz

cd /opt
sudo wget https://nodejs.org/dist/v18.17.1/node-v18.17.1-linux-x64.tar.xz
sudo tar -xvf /opt/node-v18.17.1-linux-x64.tar.xz
sudo ln -s /opt/node-v18.17.1-linux-x64/bin/node /usr/bin/node
sudo ln -s /opt/node-v18.17.1-linux-x64/bin/npm /usr/bin/npm
sudo ln -s /opt/node-v18.17.1-linux-x64/bin/npx /usr/bin/npx
sudo rm /opt/node-v18.17.1-linux-x64.tar.xz
cd

git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
nvim --headless "+Lazy! sync" +qa

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
