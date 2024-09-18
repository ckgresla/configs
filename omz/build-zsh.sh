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

# Step 3: Download min_zshrc and append its contents to ~/.zshrc
MIN_ZSHRC="$HOME/.min_zshrc"
MIN_ZSHRC_URL="https://raw.githubusercontent.com/ckgresla/configs/refs/heads/main/omz/min_zshrc"

if [ ! -f "$MIN_ZSHRC" ]; then
    echo "min_zshrc not found in the home directory. Downloading min_zshrc..."
    wget -qO "$MIN_ZSHRC" "$MIN_ZSHRC_URL"
    echo "Downloaded min_zshrc to $HOME."
else
    echo "min_zshrc already exists in the home directory."
fi

# Step 4: Append the contents of min_zshrc to ~/.zshrc
echo "Appending contents of min_zshrc to ~/.zshrc..."
grep -qxF "source $MIN_ZSHRC" "$HOME/.zshrc" || echo "source $MIN_ZSHRC" >> "$HOME/.zshrc"
echo "Done."

# Step 5: Download lab.zsh-theme to the custom/themes directory of Oh My Zsh
THEME_URL="https://raw.githubusercontent.com/ckgresla/configs/refs/heads/main/omz/themes/lab.zsh-theme"
THEME_DIR="$HOME/.oh-my-zsh/custom/themes"
THEME_FILE="$THEME_DIR/lab.zsh-theme"

if [ ! -f "$THEME_FILE" ]; then
    echo "Downloading lab.zsh-theme to $THEME_DIR..."
    mkdir -p "$THEME_DIR"
    wget -qO "$THEME_FILE" "$THEME_URL"
    echo "Downloaded lab.zsh-theme to $THEME_DIR."
else
    echo "lab.zsh-theme already exists in the custom/themes directory."
fi

# Step 6: Change the default shell to zsh
if [ "$SHELL" != "$(command -v zsh)" ]; then
    echo "Changing the default shell to zsh..."
    chsh -s "$(command -v zsh)"
    echo "Default shell changed to zsh."
else
    echo "Default shell is already zsh."
fi


echo "zsh setup completed successfully."

