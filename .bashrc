#
# ~/.bashrc=
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# pnpm (start)
# export PNPM_HOME="$HOME/.local/share/pnpm"
# case ":$PATH:" in
#   *":$PNPM_HOME:"*) ;;
#   *) export PATH="$PNPM_HOME:$PATH" ;;
# esac
# pnpm (end)


# git command short (start) 
alias ga='git add .'
alias gst='git status'
alias gcm='git commit -m'
alias gbr='git branch'
alias gco='git checkout'
alias gp='git push'
alias gk='git add . && git commit -m'
alias glog='git log'
alias gclone='git clone'
# git command short (end) 

# Config send folder to dotfiles github
# alias gsend='bash ${HOME}/gsend.sh'
# alias movedotfile='bash ${HOME}/mvdotfilesarch.sh'
# alias repogithub='bash ${HOME}/repo-github.sh'

# Config tmux new name session
alias tmux1='tmux new -s coding1'
alias tmux2='tmux new -s coding2'
alias tmux3='tmux new -s coding3'
alias tmux4='tmux new -s coding4'


# command package manager short start
# alias bi='bun install'
# alias bdev='bun dev'
# alias ba='bun add'
# alias br='bun remove'
# alias bu='bun update'
# alias bup='bun upgrade'
# alias buv='curl -fsSL https://bun.sh/install | bash'
# alias bx='bunx'

alias pi='pnpm install'
alias pdev='pnpm dev'
alias pa='pnpm add'
alias pr='pnpm remove'
alias pu='pnpm update'
alias pgl='pnpm -g list'
alias pel='pnpm env list'
alias peug='pnpm env use --global'
alias perg='pnpm env remove --global'
alias px='pnpm dlx'
alias puv='wget -qO- https://get.pnpm.io/install.sh | sh -'
# command package manager short end
#
# nuxt start using pnpm
# alias nuxt-add='pnpm dlx nuxi add'
# alias nuxt-analyze='pnpm dlx nuxi analyze'
# alias nuxt-build='pnpm dlx nuxi build'
# alias nuxt-dev='pnpm dlx nuxi dev'
# alias nuxt-module='pnpm dlx nuxi module'
# alias nuxt-module-add='pnpm dlx nuxi module add'
# alias nuxt-module-search='pnpm dlx nuxi module search'
# alias nuxt-typecheck='pnpm dlx nuxi typecheck'
# alias nuxt-upgrade='pnpm dlx nuxi upgrade'
# nuxt end

# aria2 downloader start
alias ardown='bash ${HOME}/.aria2/aria2.sh'
# aria2 downloader end

# youtube downloader mp3 start
alias ytbmp3='bash ${HOME}/youtubemp3/youtubemp3.sh'
# youtube downloader mp3 end

# youtube2 downloader video start
alias ytbvid='bash ${HOME}/youtubeVideo/youtubeVideo.sh'
# youtube2 downloader video end

# Config auto open file or folder nvim aria2 and alacritty
alias znvim='cd ${HOME}/.config/nvim && nvim .'
alias zaria2='cd ${HOME}/.aria2 && nvim .'
alias zbashrc='cd ${HOME} && nvim .bashrc'
alias zstarship='cd ${HOME}/.config/starship && nvim starship.toml'

# set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

# set up eza alternative change ls
alias ls="eza -G -a -m -h --long --git --no-user --no-filesize --icons=always --color=always "

# Go Alias
alias gor="go run"
alias gob="go build"

# set up arch update and clean
# alias arch-update="sudo pacman -Syu --noconfirm && yay -Syu --noconfirm"
# alias arch-clean="sudo pacman -Scc && yay -Scc && rm -rvf ~/.cache/*"
# alias arch-check-cache="du -sh /var/cache/pacman/pkg && du -sh .cache"
# alias arch-install="sudo pacman -Sy --noconfirm"
# alias arch-remove="sudo pacman -R"
# alias arch-search-installed="sudo pacman -Qs"
# alias arch-search-package="sudo pacman -Fy"
# alias arch-yay-update="yay -Sua"

# set up termux package management
alias tupgrade="pkg upgrade -y" 
alias tsearch='read -p "Search Package : " searchNamePackage && pkg search $searchNamePackage' 
alias tsearch='read -p "Show Package : " showNamePackage && pkg show $showNamePackage' 
alias tlist-all="pkg list-all" 
alias tlist-install="pkg list-installed" 
alias tinstall='read -p "Name Package : " namePackage && pkg install $namePackage -y'
alias tremove='read -p "Package Name : " packageName && pkg uninstall $packageName -y' 
alias tautoclean="pkg autoclean" # Remove outdated .deb files from the cache. 
alias tclean="pkg clean" # Remove all .deb files from the cache.
alias tfiles='read -p "Search Package : " searchPackage && pkg files $searchPackage' # List files installed by specified package. 

# Config starship
eval "$(starship init bash)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# Config zoxide
eval "$(zoxide init bash)"
alias cd="z"

# Bash auto complete
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

# Copy Paste
alias tcopy='termux-clipboard-set'
alias tpaste='termux-clipboard-get'

# Record Screen 
alias screen-record="ffmpeg -video_size 1366x768 -framerate 30 -f x11grab -i :0.0+0,0 -c:v libx264rgb -crf 0 -preset ultrafast $HOME/Videos/video.mp4"

# Rust and Cargo command alias
alias car='cargo run'
alias cab='cargo build'
alias cartest='read -p "test run : " test_function && cargo test $test_function -- --exact --nocapture'
