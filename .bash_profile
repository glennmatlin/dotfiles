# Set architecture flags
export ARCHFLAGS="-arch x86_64"

# Virtual Environments
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/development

# export PATH=$VIRTUALENVWRAPPER_VIRTUALENV$PATH
source /usr/local/bin/virtualenvwrapper.sh

#-------------------------------------------------------------
# DOTFILES
#-------------------------------------------------------------

# # Resolve DOTFILES_DIR (assuming ~/.dotfiles on distros without readlink and/or $BASH_SOURCE/$0)

# READLINK=$(which greadlink || which readlink)
# CURRENT_SCRIPT=$BASH_SOURCE

# if [[ -n $CURRENT_SCRIPT && -x "$READLINK" ]]; then
#   SCRIPT_PATH=$($READLINK -f "$CURRENT_SCRIPT")
#   DOTFILES_DIR=$(dirname "$(dirname "$SCRIPT_PATH")")

if [ -d "$HOME/.dotfiles" ]; then
  DOTFILES_DIR="$HOME/.dotfiles"
else
  echo "Unable to find dotfiles, exiting."
  return
fi

# Add `~/bin` to the `$PATH`
PATH="$DOTFILES_DIR/bin:$PATH"

# # Read cache
# DOTFILES_CACHE="$DOTFILES_DIR/.cache.sh"
# [ -f "$DOTFILES_CACHE" ] && . "$DOTFILES_CACHE"


# Finally we can source the dotfiles (order matters)
for DOTFILE in "$DOTFILES_DIR"/.{export,alias,function,lendup}; do
  # [ -r "$DOTFILE" ] && [ -f "$DOTFILE" ] && 
  source "$DOTFILE";
done;
unset DOTFILE;


# env,alias,inputrc,function,function_*

# if is-macos; then
#   for DOTFILE in "$DOTFILES_DIR"/.{env,alias,function}.macos; do
#     [ -f "$DOTFILE" ] && . "$DOTFILE"
#   done
# fi

# Set LSCOLORS
if is-macos; then
  eval "$(gdircolors "$DOTFILES_DIR"/.dir_colors)"
else
  eval "$(dircolors "$DOTFILES_DIR"/.dir_colors)"
fi

# Only load Liquid Prompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source ~/liquidprompt/liquidprompt

# # Case-insensitive globbing (used in pathname expansion)
# shopt -s nocaseglob;

# # Append to the Bash history file, rather than overwriting it
# shopt -s histappend;

# # Autocorrect typos in path names when using `cd`
# shopt -s cdspell;

# # Enable some Bash 4 features when possible:
# # * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# # * Recursive globbing, e.g. `echo **/*.txt`
# for option in autocd globstar; do
#   shopt -s "$option" 2> /dev/null;
# done;

# # Add tab completion for many Bash commands
# if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
#   source "$(brew --prefix)/share/bash-completion/bash_completion";
# elif [ -f /etc/bash_completion ]; then
#   source /etc/bash_completion;
# fi;

# # Enable tab completion for `g` by marking it as an alias for `git`
# if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
#   complete -o default -o nospace -F _git g;
# fi;

# # Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
# [ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Clean up

unset READLINK CURRENT_SCRIPT SCRIPT_PATH DOTFILE EXTRAFILE

# Export

export DOTFILES_DIR DOTFILES_EXTRA_DIR