#!/bin/env bash 

echo "Cleaning neovim old configuration"

rm -rf $HOME/.config/nvim
rm -rf $HOME/.local/share/nvim
rm -rf $HOME/.cache/nvim

echo "Clean comple, now install packer"
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
clear
echo "Packer installed sucefully 😃😃😃"

echo "now install neovim config"
git clone https://github.com/idcmardelplata/neovim_configuration.git $HOME/.config/nvim


echo "Neovim is now installed"
