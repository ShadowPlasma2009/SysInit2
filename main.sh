#!/usr/bin/env bash

# Declare script's run directory
SCRIPTDIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

# Delete old/misconfigured OhMyZsh files
printf "Attempting to delete old/misconfigured OhMyZsh files...\n"

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

sleep 0.5

printf "Installing Oh My Zsh\n"
RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
sleep 0.5

printf "Configuring OhMyZsh Installation...\n"
if [ -d "$HOME/.oh-my-zsh" ]; then
    mv "$HOME/.oh-my-zsh" "$HOME/.config/oh-my-zsh"
    printf "Moved oh-my-zsh folder to .config/\n"
    sleep 0.5
else
    printf ".oh-my-zsh/ not found in home directory.\n"
    sleep 0.5
    exit 1
fi

printf "Importing preconfigured .zshrc and .zshenv files...\n"
printf "Creating $HOME/.config/zsh/ if necessary...\n"
if [ ! -d "$HOME/.config/zsh" ]; then
    mkdir -p "$HOME/.config/zsh"
    printf "Created $HOME/.config/zsh/\n"
    sleep 0.5
else
    printf "$HOME/.config/zsh/ already exists. Skipping...\n"
    sleep 0.5
fi

cp "$SCRIPTDIR/.zshrc" "$HOME/.config/zsh"
cp "$SCRIPTDIR/.zshenv" "$HOME"
printf "Copied .zshrc to $HOME/.config/zsh/\n"
printf "Copied .zshenv to $HOME\n"
sleep 0.5

printf "Importing preconfigured .bashrc and 10-xdg-env.conf...\n"
printf "Creating $HOME/.config/environment.d/ if necessary...\n"
if [ ! -d "$HOME/.config/environment.d" ]; then
    mkdir -p "$HOME/.config/environment.d"
    printf "Created $HOME/.config/environment.d/\n"
else
    printf "$HOME/.config/environment.d/ already exists. Skipping...\n"
    sleep 0.5
fi

cp "$SCRIPTDIR/.bashrc" "$HOME/.bashrc"
cp "$SCRIPTDIR/10-xdg-env.conf" "$HOME/.config/environment.d"
printf "Copied .bashrc to $HOME\n"
printf "Copied 10-xdg-env.conf to $HOME/.config/environment.d/\n"
sleep 0.5


echo "Creating standard directories if necessary.\n"

if [ ! -d "$HOME/Downloads" ]; then
    echo "Downloads folder doesn't exist. Creating...\n"
    mkdir $HOME/Downloads
else
    echo "Downloads folder exists. Skipping...\n"
fi

sleep 0.5

if [ ! -d "$HOME/Desktop" ]; then
    echo "Desktop folder doesn't exist. Creating...\n"
    mkdir $HOME/Desktop
else
    echo "Desktop folder exists. Skipping...\n"
fi

sleep 0.5

if [ ! -d "$HOME/Documents" ]; then
    echo "Documents folder doesn't exist. Creating...\n"
    mkdir $HOME/Documents
else
    echo "Documents folder exists. Skipping...\n"
fi

sleep 0.5

if [ ! -d "$HOME/Music" ]; then
    echo "Music folder doesn't exist. Creating...\n"
    mkdir $HOME/Music
else
    echo "Music folder exists. Skipping...\n"
fi

sleep 0.5

if [ ! -d "$HOME/Pictures" ]; then
    echo "Pictures folder doesn't exist. Creating...\n"
    mkdir $HOME/Pictures
else
    echo "Pictures folder exists. Skipping...\n"
fi

sleep 0.5

if [ ! -d "$HOME/Videos" ]; then
    echo "Videos folder doesn't exist. Creating...\n"
    mkdir $HOME/Videos
else
    echo "Videos folder exists. Skipping...\n"
fi

sleep 0.5

if [ ! -d "$HOME/Templates" ]; then
    echo "Templates folder doesn't exist. Creating...\n"
    mkdir $HOME/Templates
else
    echo "Templates folder exists. Skipping...\n"
fi

sleep 0.5

if [ ! -d "$HOME/Public" ]; then
    echo "Public folder doesn't exist. Creating...\n"
    mkdir $HOME/Public
else
    echo "Public folder exists. Skipping...\n"
fi

sleep 0.5


echo "Creating XDG Base Directories if necessary...\n"

if [ ! -d "$HOME/.config" ]; then
    mkdir $HOME/.config
    echo "Created .config/\n"
else
    echo ".config/ exists. Skipping...\n"
fi

sleep 0.5

if [ ! -d "$HOME/.cache" ]; then
    mkdir $HOME/.cache
    echo "Created .cache/\n"
else
    echo ".cache/ exists. Skipping...\n"
fi

sleep 0.5

if [ ! -d "$HOME/.local/share" ]; then
    mkdir -p $HOME/.local/share
    echo "Created .local/share/\n"
else
    echo ".local/share/ exists. Skipping...\n"
fi

sleep 0.5

if [ ! -d "$HOME/.local/state" ]; then
    mkdir -p $HOME/.local/state
    echo "Created .local/state/\n"
else
    echo ".local/state/ exists. Skipping...\n"
fi

sleep 0.5

printf "Deleting different stray files and folders so their respective software\n"
printf "can recreate them in XDG Directories."

rm -f .bash_history .zsh_history *zcomdump*