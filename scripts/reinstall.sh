sudo pacman -Syy

sudo pacman -S --needed base-devel bat eza docker docker-compose ripgrep python3 python-pip pyenv git git-delta vim curl wget zsh firefox ufw direnv fprintd rustup reflector power-profiles-daemon pacman-contrib rsync sccache rustup alacritty networkmanager pre-commit -y

# Configure UFW
sudo ufw enable
sudo systemctl enable ufw.service

# Oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# Zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# Zsh-autcompletions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
# Zsh-history
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search


# Starship
curl -sS https://starship.rs/install.sh | sh

# Poetry
curl -sSL https://install.python-poetry.org | python3 -

# Clear installation
sudo pacman -R gnome-tour gnome-console gnome-music

# Enable NetworkManager
sudo systemctl enable NetworkManager.service

# Enable Reflector
sudo systemctl enable reflector.service
sudo systemctl enable reflector.timer

# Enable Docker
sudo systemctl enable docker.service
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
docker run hello-world

# Enable power-profiles-daemon
sudo systemctl enable power-profiles-daemon

# Rustup
rustup default stable

# Install paru
cd /tmp
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

# Install AUR packages
paru -S spotify windsurf powerpill

# Install professional AUR packages
paru -S slack-desktop 1password 1password-cli ngrok

# Enable TRIM
sudo systemctl enable --now fstrim.timer

# Enable preload
sudo systemctl enable preload

# Enable Bluetooth
sudo systemctl enable bluetooth.service

# Enable paccache
sudo systemctl enable paccache.timer

# Configure git
git config --global user.email "clement@qevlar.com"
git config --global user.name "Clément Jacquemaire"
git config --global core.editor "vim"
git config --global core.pager delta
git config --global interactive.diffFilter 'delta --color-only'
git config --global delta.navigate true
git config --global delta.side-by-side true
git config --global merge.conflictStyle zdiff3
git config --global --type bool push.autoSetupRemote true
git config --global pull.rebase true

# Configure Alacritty
mkdir -p ~/.config/alacritty/themes
touch $HOME/.config/alacritty/alacritty.toml
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
echo '
[general]
import = [
    "~/.config/alacritty/themes/themes/{theme}.toml"
]

[window]
startup_mode = "Fullscreen"

[scrolling]
history = 100000

[selection]
save_to_clipboard = true

[terminal]
shell = "/bin/zsh"

[mouse]
hide_when_typing = true
' > $HOME/.config/alacritty/alacritty.toml

# Activate numlock at startup (GNOME)
gsettings set org.gnome.desktop.peripherals.keyboard numlock-state true

# Configure Cargo
# mkdir -p ~/.config/cargo
echo '
[target.x86_64-unknown-linux-gnu]
rustflags = ["-C", "target-cpu=native"]

[build]
rustc-wrapper = "sccache"

' >> ~/.config/cargo/config 
