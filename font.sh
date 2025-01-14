# Install recommended fonts for Powerlevel10k
echo "Installing recommended fonts..."
FONT_REPO_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.0/JetBrainsMono.zip"
FONT_DIR="$HOME/.local/share/fonts"

mkdir -p "$FONT_DIR"
curl -fLo "$FONT_DIR/JetBrainsMono.zip" "$FONT_REPO_URL"

# Unzip the fonts
unzip -o "$FONT_DIR/JetBrainsMono.zip" -d "$FONT_DIR"
rm "$FONT_DIR/JetBrainsMono.zip"

# Update font cache
fc-cache -fv

echo "Nerd Fonts installed successfully."
