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
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        sudo apt update && sudo apt install -y zsh
    else
        echo "Unsupported OS. Please install zsh manually."
        exit 1
    fi
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


# Step 3: Replace the default ~/.zshrc with ckg's min_zshrc from the provided URL
ZSHRC_URL="https://raw.githubusercontent.com/ckgresla/configs/refs/heads/main/omz/min_zshrc"
ZSHRC_FILE="$HOME/.zshrc"

echo "Downloading min_zshrc to replace the current ~/.zshrc..."
wget -qO "$ZSHRC_FILE" "$ZSHRC_URL"
echo "Replaced ~/.zshrc with min_zshrc."


# Step 4: Download min_zshrc and append its contents to ~/.zshrc
ALIASES_FILE="$HOME/.zsh_aliases"
ALIASES_URL="https://raw.githubusercontent.com/ckgresla/configs/refs/heads/main/omz/.zsh_aliases"

if [ ! -f "$MIN_ZSHRC" ]; then
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

# Append the theme to ~/.zshrc if not already present
echo "adding ephemeral-node theme to $HOME/.zshrc"
grep -qxF "ZSH_THEME=\"ephemeral-node\"" "$HOME/.zshrc" || echo "ZSH_THEME=\"ephemeral-node\"" >> "$HOME/.zshrc"
echo "Done."


# Step 7: Change the default shell to zsh
if [ "$SHELL" != "$(command -v zsh)" ]; then
    echo "Changing the default shell to zsh..."
    chsh -s "$(command -v zsh)"
    echo "Default shell changed to zsh."
else
    echo "Default shell is already zsh."
fi


echo "zsh setup completed successfully."

