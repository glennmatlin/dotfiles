# Homebrew Initalization
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Starship
eval "$(starship init zsh)"

# Enable VSCode on WSL
alias code ="/mnt/c/Users/Research/scoop/apps/vscode/current/Code.exe"

# use local install of claude code
alias claude="~/.claude/local/claude"

z() {
  zellij "$@"
}

askclaude() {
  claude -p --model sonnet "$@"
}

# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
export PATH="/home/gmatlin/.local/bin:$PATH"
