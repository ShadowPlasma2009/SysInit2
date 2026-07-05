#!/usr/bin/env bash

# Delete old/misconfigured OhMyZsh files
printf "Attempting to delete old/misconfigured OhMyZsh files..."

if [ -d "$HOME/.oh-my-zsh" ] || [ -d "$HOME/oh-my-zsh" ]; then
    rm -rf $HOME/.oh-my-zsh $HOME/oh-my-zsh
fi

if [ -d "$HOME/.config/.oh-my-zsh" ] || [ -d "$HOME/.config/oh-my-zsh" ]; then
    rm -rf $HOME/.config/.oh-my-zsh $HOME/.config/oh-my-zsh
fi

if [ -d "$HOME/.config/zsh/ohmyzsh" ] || [ -d "$HOME/.config/zsh/.ohmyzsh" ]; then
    rm -rf $HOME/.config/zsh/ohmyzsh $HOME/.config/zsh/.ohmyzsh
fi

if [ -d "$HOME/.config/zsh/oh-my-zsh" ] || [ -d "$HOME/.config/zsh/.oh-my-zsh" ]; then
    rm -rf $HOME/.config/zsh/oh-my-zsh $HOME/.config/zsh/.oh-my-zsh
fi

sleep 0.3

echo "Installing Oh My Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Test Text"