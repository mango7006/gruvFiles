#!/bin/bash

source ~/secret.sh

repo=~/gits/gruvFiles
repo_link=mango7006/gruvFiles.git
repo_config=~/gits/gruvFiles/config/
repo_home=~/gits/gruvFiles/home/
repo_ff=~/gits/gruvFiles/Firefox/

echo "Updating github repo for Dotfiles"

sudo cp -r ~/gits/Firefox/ $repo_ff

sudo cp ~/.zshrc $repo_home
sudo cp ~/.wezterm.lua $repo_home

sudo cp ~/.config/starship.toml $repo_config
sudo cp -r ~/.config/dunst/ $repo_config
sudo cp -r ~/.config/fastfetch/ $repo_config
sudo cp -r ~/.config/hypr/ $repo_config
sudo cp -r ~/.config/nvim/ $repo_config
sudo cp -r ~/.config/waybar/ $repo_config
sudo cp -r ~/.config/wofi/ $repo_config

read -r -p "Do you want to push to github? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
  echo "Pushing to github"
  cd $repo
  git add .
  read -r -p "Commit Message: " comMessage
  git commit -m "$comMessage"
  git push $gittoken@github.com/$repo_link
else
  echo "Not pushing changes to github"
fi

echo "Script ended"
