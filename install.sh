#!/bin/bash

# Glenn's Development Environment Setup Script
# Sets up dotfiles and .config repositories with starship prompt

set -e  # Exit on error

echo "🚀 Starting development environment setup..."

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}==>${NC} $1"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    print_error "This script is designed for macOS. Please modify for your OS."
    exit 1
fi

# Install Homebrew if not installed
if ! command -v brew &> /dev/null; then
    print_status "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for this session
    if [[ -d "/opt/homebrew" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        eval "$(/usr/local/bin/brew shellenv)"
    fi
    print_success "Homebrew installed"
else
    print_success "Homebrew already installed"
fi

# Clone dotfiles repository if not already cloned
DOTFILES_DIR="$HOME/Codespace/dotfiles"
if [ ! -d "$DOTFILES_DIR" ]; then
    print_status "Cloning dotfiles repository..."
    mkdir -p "$HOME/Codespace"
    git clone https://github.com/glennmatlin/dotfiles.git "$DOTFILES_DIR"
    print_success "Dotfiles repository cloned"
else
    print_success "Dotfiles repository already exists"
    print_status "Pulling latest changes..."
    cd "$DOTFILES_DIR" && git pull
fi

# Install brew packages
print_status "Installing brew packages..."
cd "$DOTFILES_DIR"
bash brew
print_success "Brew packages installed"

# Clone .config repository
CONFIG_DIR="$HOME/.config"
if [ ! -d "$CONFIG_DIR/.git" ]; then
    print_status "Cloning .config repository..."
    # Backup existing .config if it exists and is not empty
    if [ -d "$CONFIG_DIR" ] && [ "$(ls -A $CONFIG_DIR)" ]; then
        print_warning "Backing up existing .config directory..."
        mv "$CONFIG_DIR" "$CONFIG_DIR.backup.$(date +%Y%m%d_%H%M%S)"
    fi
    git clone https://github.com/glennmatlin/dot_config.git "$CONFIG_DIR"
    print_success ".config repository cloned"
else
    print_success ".config repository already exists"
    print_status "Pulling latest changes..."
    cd "$CONFIG_DIR" && git pull
fi

# Link zshrc file
print_status "Setting up zsh configuration..."
if [ -f "$HOME/.zshrc" ] && [ ! -L "$HOME/.zshrc" ]; then
    print_warning "Backing up existing .zshrc..."
    mv "$HOME/.zshrc" "$HOME/.zshrc.backup.$(date +%Y%m%d_%H%M%S)"
fi
ln -sf "$DOTFILES_DIR/zshrc_starship" "$HOME/.zshrc"
print_success "zshrc linked"

# Create .local/bin directory for user scripts
mkdir -p "$HOME/.local/bin"

# Install Neovim plugins (in headless mode)
if command -v nvim &> /dev/null; then
    print_status "Installing Neovim plugins..."
    nvim --headless "+Lazy! sync" +qa || print_warning "Some Neovim plugins may need manual installation"
    print_success "Neovim plugins installed"
else
    print_warning "Neovim not found. Please install it and run ':Lazy sync' manually"
fi

# Final checks
print_status "Verifying installation..."

# Check for required commands
REQUIRED_COMMANDS=("git" "brew" "nvim" "starship" "fd" "rg" "lazygit")
MISSING_COMMANDS=()

for cmd in "${REQUIRED_COMMANDS[@]}"; do
    if ! command -v "$cmd" &> /dev/null; then
        MISSING_COMMANDS+=("$cmd")
    fi
done

if [ ${#MISSING_COMMANDS[@]} -eq 0 ]; then
    print_success "All required tools are installed!"
else
    print_warning "The following tools are missing: ${MISSING_COMMANDS[*]}"
    print_warning "Please run 'bash $DOTFILES_DIR/brew' to install them"
fi

print_success "🎉 Development environment setup complete!"
echo ""
echo "Next steps:"
echo "1. Restart your terminal or run: source ~/.zshrc"
echo "2. Open Neovim with 'nvim' to explore your LazyVim setup"
echo "3. Check your starship configuration at ~/.config/starship.toml"
echo ""
echo "Your repositories:"
echo "  - Dotfiles: $DOTFILES_DIR"
echo "  - Config: $CONFIG_DIR"
echo ""
echo "To update your environment in the future, run:"
echo "  cd $DOTFILES_DIR && git pull && bash install.sh"