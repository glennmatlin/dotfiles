# Glenn's .dotfiles

## Dotfile Management
- https://dotfiles.github.io/utilities/
- https://github.com/webpro/awesome-dotfiles
- https://github.com/jbernard/dotfiles

## Shell
https://github.com/ryanoasis/nerd-fonts

### Starship
https://youtu.be/Xyr_EOmEB_g
https://starship.rs/

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

### `pyenv`

* https://github.com/pyenv/pyenv
* https://github.com/pyenv/pyenv-virtualenv

## Windows

### `chocolatey`
https://chocolatey.org/install#individual

### `scoop`
https://scoop.sh/

#### Oh My Posh

https://ohmyposh.dev/

1. Install `oh-my-posh`

```powershell
scoop install https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json
```
2. Edit your profile

```powershell
notepad $PROFILE
```
3. Add the snippet below

```powershell
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/powershell10k_rainbow.omp.json" | Invoke-Expression
```

4. Reload your shell

```powershell
. $PROFILE
```
