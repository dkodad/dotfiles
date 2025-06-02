#!/usr/bin/env bash

set -e

echo "Installing apps"
sudo dnf install gimp tldr fzf stylua npm node go curl git -y

git clone git@github.com/dkodad/dotfiles.git $HOME/dotfiles --depth 1
go install github.com/air-verse/air@latest

wget --output-document /tmp/luarocks.tar.gz https://luarocks.org/releases/luarocks-3.11.0.tar.gz
tar zxpf /tmp/luarocks.tar.gz -C /tmp
cd /tmp/luarocks-3.11.0 || exit 1
./configure && make && sudo make install


echo "Installing hyprland"
sudo dnf install ttf-font-awesome waybar ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols
sudo dnf install hyprlock -y
sudo dnf install ghostty -y
sudo dnf install hyprpaper hyprshot

sudo dnf install wlogout -y


echo "Installing fzf"
git clone git@github.com:junegunn/fzf.git $HOME/fzf
$HOME/fzf/install


echo "Installing nodejs"
sudo dnf install nodejs npm
npm config set prefix ~/.local/npm
npm i -g n
n lts

curl -fsSL https://deno.land/install.sh | sh
curl -fsSL https://bun.sh/install | bash


echo "Installing rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install stylua --features luajit


echo "Installing neovim"
sudo dnf install neovim -y

echo "Installing lazygit"
sudo dnf install lazygit -y 


echo "Installing gdb"
bash -c "$(curl -fsSL https://gef.blah.cat/sh)"

echo "Installing zsh"
sudo dnf install zsh 
hash -r
sudo chsh -s /usr/bin/zsh
echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
