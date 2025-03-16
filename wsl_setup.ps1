# Install WSL with Ubuntu
wsl --install -d Ubuntu

# Ensure WSL2 is used
wsl --set-default-version 2
wsl --set-version Ubuntu 2

# Import your Linux dotfiles to WSL
wsl -d Ubuntu -u root bash -c "apt update && apt install -y git"
wsl -d Ubuntu -e bash -c "git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles"