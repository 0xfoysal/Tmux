#!/bin/bash

# Ensure the script is run as a regular user (not root)
if [ "$EUID" -eq 0 ]; then
    echo "Please do not run this script as root or with sudo."
    exit 1
fi

# Update system package lists
echo "Updating package lists..."
sudo apt update

# Install required packages
echo "Installing Zsh and dependencies..."
sudo apt install -y zsh git curl wget

# Install Powerlevel10k theme
echo "Installing Powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$HOME/.powerlevel10k"

# Install Oh My Zsh (optional but recommended)
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended

# Set Zsh as the default shell
echo "Setting Zsh as the default shell..."
chsh -s $(which zsh)

# Configure .zshrc for Powerlevel10k theme
echo "Configuring .zshrc for Powerlevel10k..."
if ! grep -q "POWERLEVEL10K" "$HOME/.zshrc"; then
    echo "# Enable Powerlevel10k theme" >> "$HOME/.zshrc"
    echo "source \"$HOME/.powerlevel10k/powerlevel10k.zsh-theme\"" >> "$HOME/.zshrc"
fi

# Install recommended fonts for Powerlevel10k
echo "Installing recommended fonts..."
git clone https://github.com/ryanoasis/nerd-fonts.git --depth 1
cd nerd-fonts
./install.sh
cd ..
rm -rf nerd-fonts

# Inform the user about reboot or restarting the terminal
echo -e "\nInstallation complete! Please restart your terminal or log out and log back in to start using Zsh with the Powerlevel10k theme."

# Optional: Run Powerlevel10k configuration wizard
echo "Would you like to run the Powerlevel10k configuration wizard now? (y/n)"
read -r response
if [[ "$response" =~ ^[Yy]$ ]]; then
    exec zsh -c "p10k configure"
fi
