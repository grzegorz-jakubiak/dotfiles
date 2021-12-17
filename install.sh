#!/usr/bin/env bash

set -e

command_exists() {
    type "$1" > /dev/null 2>&1
}

configure_zsh() {
    # Install oh-my-zsh
    echo "Installing oh-my-zsh using curl..."
    curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | zsh

    # Install zsh-autosuggestions
    echo "Installing zsh-autosuggestions curl..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

    # Install powerlevel10k
    echo "Installing powerlevel10k curl..."
    git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
}

echo "Installing dotfiles."

if ! command_exists zsh; then
    echo "zsh not found. Please install and then re-run installation scripts"
    exit 1
elif ! [ -n "$ZSH_VERSION" ]; then
    configure_zsh
else
    echo "Configuring zsh as default shell"
    chsh -s "$(which zsh)"

    configure_zsh
fi

# Git
source install/git.sh

# links
source install/link.sh

if [[ "$OSTYPE" = "darwin"* ]]; then
    echo -e "\\n\\nRunning on MacOS"

    source install/macos.sh
fi


echo "Done. Reload your terminal."
