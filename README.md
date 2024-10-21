# Glenn's .dotfiles

## Shell

### Bash

### ZSH

#### oh-my-zsh

##### omz Themes

- https://github.com/romkatv/powerlevel10k
  install fonts

  https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#manual-font-installation

  ```
  git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

  ```
- https://github.com/powerline/fonts
- https://github.com/ryanoasis/nerd-fonts

##### omg plugins

Plugins

    zsh-autosuggestions

Install the zsh-autosuggestions plugin:

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

Add the plugin to the ~/.zshrc file:

plugins=(git)
plugins=(git zsh-autosuggestions)

After resource the ~/.zshrc file source ~/.zshrc, the zsh-autosuggestions plugin will work.

    zsh-syntax-highlighting

Install the zsh-syntax-highlighting plugin:

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

Add the plugin to the ~/.zshrc file:

plugins=(git zsh-autosuggestions)
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

After resource the ~/.zshrc file source ~/.zshrc, the zsh-syntax-highlighting plugin will work.

## Python

### Pyenv

* https://github.com/pyenv/pyenv
* https://github.com/pyenv/pyenv-virtualenv
