#!/bin/bash

source ~/secret.sh

repo=~/gits/gruvFiles
repo_link=mango7006/gruvFiles.git
repo_config=~/gits/gruvFiles/config/
repo_home=~/gits/gruvFiles/home/

echo "Updating github repo for Dotfiles"

sudo cp ~/.zshrc $repo_home
sudo cp ~/.wezterm.lua $repo_home

sudo cp ~/.config/starship.toml $repo_config
sudo cp -r ~/.config/dunst/ $repo_config
sudo cp -r ~/.config/fastfetch/ $repo_config
sudo cp -r ~/.config/hypr/ $repo_config
sudo cp -r ~/.config/nvim/ $repo_config
sudo cp -r ~/.config/waybar/ $repo_config
sudo cp -r ~/.config/wofi/ $repo_config
sudo cp -r ~/.config/spicetify/config-xpui.ini $repo_config/spicetify
sudo cp -r ~/.config/spicetify/Themes/ $repo_config/spicetify
sudo cp -r ~/.config/vesktop/themes/ $repo_config/vesktop/themes
sudo chmod ugo+rwx $repo_config/spicetify/Themes

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
