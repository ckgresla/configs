#!/bin/bash
# Convert thyself from bash to zsh, standalone builder script to fetch the contents of this dir and set it up
# intended for use on Ubuntu-like systems


# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}


# Step 1: Check if zsh is installed on local sys
if ! command_exists zsh; then
    echo "zsh is not installed. Installing zsh..."
    if [[ "$OSTYPE" != "linux-gnu"* ]]; then
        echo "Unsupported OS. Please install zsh manually."
        exit 1
    fi
    sudo apt update -y 
    sudo apt-get install -y zsh
else
    echo "zsh is already installed."
fi

# Step 2: Check if Oh My Zsh is installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh is not installed. Installing Oh My Zsh..."
    RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh My Zsh is already installed."
fi


# Step 3: Replace the default ~/.zshrc with ckg's dev-zshrc from the provided URL
ZSHRC_URL="https://raw.githubusercontent.com/ckgresla/configs/refs/heads/main/omz/dev-zshrc"
ZSHRC_FILE="$HOME/.zshrc"

echo "Downloading dev-zshrc to replace the current ~/.zshrc..."
wget -qO "$ZSHRC_FILE" "$ZSHRC_URL"
echo "Replaced ~/.zshrc with dev-zshrc."


# Step 4: Download aliases if not already present (sourced in the dev-zshrc)
ALIASES_FILE="$HOME/.zsh_aliases"
ALIASES_URL="https://raw.githubusercontent.com/ckgresla/configs/refs/heads/main/omz/.zsh_aliases"

if [ ! -f "$ALIASES_FILE" ]; then
    echo "aliases file not found in the home directory. Downloading from repo..."
    wget -qO "$ALIASES_FILE" "$ALIASES_URL"
    echo "Downloaded aliases file to $HOME."
else
    echo "aliases file already exists in the home directory."
fi

# Step 5: source the contents of the aliases file to ~/.zshrc
echo "adding in a source for the aliases to $HOME/.zshrc"
grep -qxF "source $ALIASES_FILE" "$HOME/.zshrc" || echo "source $ALIASES_FILE" >> "$HOME/.zshrc"
echo "Done."

# Step 6: Download lab.zsh-theme to the custom/themes directory of Oh My Zsh
THEME_URL="https://raw.githubusercontent.com/ckgresla/configs/refs/heads/main/omz/themes/ephemeral-node.zsh-theme"
THEME_DIR="$HOME/.oh-my-zsh/custom/themes"
THEME_FILE="$THEME_DIR/ephemeral-node.zsh-theme"

if [ ! -f "$THEME_FILE" ]; then
    echo "Downloading ephemeral-node.zsh-theme to $THEME_DIR..."
    mkdir -p "$THEME_DIR"
    wget -qO "$THEME_FILE" "$THEME_URL"
    echo "Downloaded ephemeral-node.zsh-theme to $THEME_DIR."
else
    echo "ephemeral-node.zsh-theme already exists in the custom/themes directory."
fi



echo "zsh setup completed successfully."
echo 'run: chsh -s "$(command -v zsh)" on your node to make it default'

