#!/bin/bash
sudo remove neovim
sudo wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
sudo tar xzvf nvim-linux64.tar.gz
sudo mv nvim-linux64 /usr/local/nvim
sudo ln -s /usr/local/nvim/bin/nvim /usr/bin/nvim

sudo apt-get update -y
sudo apt-get install nodejs -y
sudo apt-get install npm -y
