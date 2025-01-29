termux-change-repo
termux-setup-storage
pkg update && pkg upgrade -y
pkg install build-essential ripgrep fd unzip renameutils mediainfo termux-api zoxide eza fzf tmux nano aria2 git wget curl nmap libexpat openssl python ffmpeg python-pip python-pillow rust rust-analyzer starship 7zip neovim nodejs-lts 
pip install -U "yt-dlp[default]"
[! -d ".config"] && mkdir ".config"
[! -d ".shortcuts"] && mkdir ".shortcuts"
cp -r "${HOME}/dotfiles-termux/.aria2" "${HOME}"
cp "${HOME}/.aria2/aria2.sh" "${HOME}/.shortcuts"
chmod +x "${HOME}/.shortcuts/aria2.sh"
cp "${HOME}/dotfiles-termux/youtubemp3/youtubemp3.sh" "${HOME}/.shortcuts"
chmod +x "${HOME}/.shortcuts/youtubemp3.sh"
cp "${HOME}/dotfiles-termux/youtubeVideo/youtubeVideo.sh" "${HOME}/.shortcuts"
chmod +x "${HOME}/.shortcuts/youtubeVideo.sh"
cp -r "${HOME}/dotfiles-termux/starship" "${HOME}/.config"
cp "${HOME}/dotfiles-termux/.bashrc" "${HOME}"
termux-toast "Configuration Completed"
