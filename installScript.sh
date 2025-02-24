#!/bin/bash

gitDirHome=~/gits/gruvFiles/home
gitDir=~/gits/gruvFiles/config
conf=~/.config/
gitDirFF=~/gits/gruvFiles/Firefox

echo "Install script for dotfiles"

read -r -p "Do you want to make a backup of your current dotfiles? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
  echo "Creating backup of current dotfiles"
  mkdir -p ~/.config/bkup
  sudo tar -czvf ~/.config/bkup/backup.tar.gz $conf/dunst $conf/fastfetch $conf/hypr $conf/nvim $conf/waybar $conf/wofi $conf/starship.toml ~/.wezterm.lua ~/.zshrc
else
  echo "Not making a backup of current dotfiles"
fi

read -r -p "Are you SURE that you want to replace your dotfiles? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
  echo "Alrighty, overwriting."
  sudo cp -r $gitDir/dunst/ $conf
  sudo cp -r $gitDir/fastfetch/ $conf
  sudo cp -r $gitDir/hypr/ $conf
  sudo cp -r $gitDir/nvim/ $conf
  sudo cp -r $gitDir/waybar/ $conf
  sudo cp -r $gitDir/wofi/ $conf
  sudo cp $gitDir/starship.toml $conf

  sudo cp $gitDirHome/.wezterm.lua ~
  sudo cp $gitDirHome/.zshrc ~

  sudo cp -r $gitDirFF ~/gits/
else
  echo "Not overwriting."
fi

read -r -p "Do you want to install dependencies and packages? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
  echo "Downloading packages"
  paru --needed -S $(<pkgs.txt)
else
  echo "Not installing packages, WARNING, this might make my dotfiles unuseable."
fi

echo "End of install script"
