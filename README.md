# Glenn's Dotfiles

A modern development environment setup for macOS using [Starship prompt](https://starship.rs/) and [LazyVim](https://www.lazyvim.org/).

## Overview

This repository works in conjunction with my [dot_config](https://github.com/glennmatlin/dot_config) repository to provide a complete, reproducible development environment:

- **dotfiles** (this repo): System setup, package installations, shell configuration
- **dot_config**: Application configurations (Neovim, Git, Starship, etc.)

## Quick Start

Run this one-liner to set up everything:

```bash
curl -fsSL https://raw.githubusercontent.com/glennmatlin/dotfiles/main/install.sh | bash
```

Or clone and run manually:

```bash
git clone https://github.com/glennmatlin/dotfiles.git ~/Codespace/dotfiles
cd ~/Codespace/dotfiles
bash install.sh
```

## What Gets Installed

### Core Tools
- **Homebrew** - Package manager for macOS
- **Git** & **Git LFS** - Version control
- **Starship** - Modern, fast shell prompt
- **thefuck** - Terminal command correction

### Neovim Setup
- **Neovim** - Modern Vim fork
- **LazyVim** - Pre-configured Neovim distribution
- **fd** - Fast file finder (required by Telescope)
- **ripgrep** - Fast text search (required by Telescope)
- **lazygit** - Terminal UI for Git

### System Tools
- **nvtop** - GPU monitoring tool

## Repository Structure

```
dotfiles/
├── README.md          # This file
├── install.sh         # Automated setup script
├── brew               # Homebrew packages to install
├── zshrc_starship     # Zsh configuration with Starship
├── zshrc_mac          # Legacy oh-my-zsh config (deprecated)
└── zshrc_linux        # Linux-specific config
```

## Manual Setup

If you prefer to set things up manually:

1. **Install Homebrew** (if not already installed):
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. **Clone both repositories**:
   ```bash
   git clone https://github.com/glennmatlin/dotfiles.git ~/Codespace/dotfiles
   git clone https://github.com/glennmatlin/dot_config.git ~/.config
   ```

3. **Install packages**:
   ```bash
   cd ~/Codespace/dotfiles
   bash brew
   ```

4. **Link shell configuration**:
   ```bash
   ln -sf ~/Codespace/dotfiles/zshrc_starship ~/.zshrc
   ```

5. **Restart your terminal** and enjoy!

## Updating

To update your environment:

```bash
cd ~/Codespace/dotfiles && git pull && bash install.sh
cd ~/.config && git pull
```

## Customization

### Adding New Packages

Edit the `brew` file to add new Homebrew packages:

```bash
brew install your-package-here
```

### Shell Configuration

The `zshrc_starship` file includes:
- Sensible Zsh options
- Useful aliases and functions
- Starship prompt initialization
- Tool integrations (fzf, thefuck)

### Application Configurations

Application-specific configs are in the [dot_config](https://github.com/glennmatlin/dot_config) repository:
- `nvim/` - LazyVim configuration
- `starship.toml` - Starship prompt configuration
- `git/` - Git configuration
- And more...

## Troubleshooting

### Neovim/LazyVim Issues

If Neovim plugins fail to install:
```bash
nvim --headless "+Lazy! sync" +qa
```

Or open Neovim and run `:Lazy sync`

### Missing Commands

Run the brew script again:
```bash
cd ~/Codespace/dotfiles
bash brew
```

### Shell Not Loading Properly

Ensure your terminal is using Zsh:
```bash
chsh -s $(which zsh)
```

Then restart your terminal.

## Resources

### Dotfile Management
- https://dotfiles.github.io/utilities/
- https://github.com/webpro/awesome-dotfiles
- https://github.com/jbernard/dotfiles

### Shell & Prompt
- [Starship](https://starship.rs/)
- [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)

## License

Feel free to use and modify as needed!