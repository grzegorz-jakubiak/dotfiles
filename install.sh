#!/usr/bin/env bash

set -e

command_exists() {
    type "$1" > /dev/null 2>&1
}

echo "Installing dotfiles."

if ! command_exists zsh; then
    echo "zsh not found. Please install and then re-run installation scripts"
    exit 1
elif ! [[ $SHELL =~ .*zsh.* ]]; then
    echo "Configuring zsh as default shell"
    chsh -s "$(which zsh)"

    # Install zinit
    echo "Installing zinit using curl..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
fi

echo "Done. Reload your terminal."
