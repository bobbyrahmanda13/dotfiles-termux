termux-change-repo
termux-setup-storage
pkg update && pkg upgrade -y
pkg install bat build-essential ripgrep fd unzip renameutils mediainfo termux-api zoxide eza fzf tmux nano aria2 git wget curl nmap libexpat openssl python ffmpeg python-pip python-pillow rust rust-analyzer starship 7zip neovim nodejs-lts -y
pip install -U "yt-dlp[default]"
if [-d ".config"]; then echo "Folder .config sudah ada" else mkdir ".config" echo "Folder .config berhasil dibuat"
if [-d ".shortcuts"]; then echo "Folder .shortcuts sudah ada" else mkdir ".shortcuts" echo "Folder .shortcuts berhasil dibuat"
echo "Next copy and move file"
cp -r "${HOME}/dotfiles-termux/.aria2" "${HOME}"
cp "${HOME}/.aria2/aria2.sh" "${HOME}/.shortcuts"
chmod +x "${HOME}/.shortcuts/aria2.sh"
cp "${HOME}/dotfiles-termux/youtubemp3/youtubemp3.sh" "${HOME}/.shortcuts"
chmod +x "${HOME}/.shortcuts/youtubemp3.sh"
cp "${HOME}/dotfiles-termux/youtubeVideo/youtubeVideo.sh" "${HOME}/.shortcuts"
chmod +x "${HOME}/.shortcuts/youtubeVideo.sh"
cp -r "${HOME}/dotfiles-termux/starship" "${HOME}/.config"
cp "${HOME}/dotfiles-termux/.bashrc" "${HOME}"
echo "Configuration Completed"
exit
