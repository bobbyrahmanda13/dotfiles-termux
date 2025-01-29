#!/bin/bash

# Package install
termux-change-repo
termux-setup-storage
pkg update -y && pkg upgrade -y
pkg install bat build-essential ripgrep fd unzip renameutils mediainfo termux-api zoxide eza fzf tmux nano aria2 git wget curl nmap libexpat openssl python ffmpeg python-pip python-pillow rust starship 7zip neovim nodejs-lts -y
pip install -U "yt-dlp[default]"

# variable path
config="${HOME}/.config"
shortcuts="${HOME}/.shortcuts"
aria2="${HOME}/.aria2/aria2.sh"

# dotfiles-termux github
dot_aria2="${HOME}/dotfiles-termux/.aria2"
dot_youtubemp3="${HOME}/dotfiles-termux/youtubemp3/youtubemp3.sh"
dot_youtubeVideo="${HOME}/dotfiles-termux/youtubeVideo/youtubeVideo.sh"
dot_starship="${HOME}/dotfiles-termux/starship" 
dot_nvim="${HOME}/dotfiles-termux/nvim" 
dot_bashrc="${HOME}/dotfiles-termux/.bashrc"

mkdir $config && mkdir $shortcuts

echo "Next copy and move file"

cp -r $dot_aria2 "${HOME}"
cp $aria2 $shortcuts
chmod +x "$shortcuts/aria2.sh"

cp $dot_youtubemp3 $shortcuts
chmod +x "$shortcuts/youtubemp3.sh"

cp $dot_youtubeVideo $shortcuts
chmod +x "$shortcuts/youtubeVideo.sh"

cp -r $dot_starship $config
cp -r $dot_nvim $config
cp $dot_bashrc "${HOME}"

echo "Configuration Completed"
