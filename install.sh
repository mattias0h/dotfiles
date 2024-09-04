#!/bin/zsh

rbenv=$1

# --- Functions --- #
# Notice title
function notice { echo -e "\033[1;32m=> $1\033[0m"; }

# Error title
function error { echo -e "\033[1;31m=> Error: $1\033[0m"; }

function fetch_external {
  if [ -d $1 ]; then
    git -C $1 pull
  else
    mkdir -p $1
    git clone $2 $1
  fi
}

function install {
  notice "Copying dotfiles"
  rsync -rv --exclude '.git' --exclude 'bootstrap.sh' --exclude 'install.sh' --exclude 'README.md' --include '.**' ./ ~/
}

function externals {
  if [ ! -d "${ZDOTDIR:-$HOME}/.oh-my-zsh" ]; then
    notice "Installing oh-my-zsh"
    git clone --recursive https://github.com/robbyrussell/oh-my-zsh.git "${ZDOTDIR:-$HOME}/.oh-my-zsh"
  else
    notice "Updating oh-my-zsh"
    git -C "${ZDOTDIR:-$HOME}/.oh-my-zsh" pull
  fi

  notice "Updating plugins"
  fetch_external ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting "https://github.com/zsh-users/zsh-syntax-highlighting.git"
  fetch_external ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions "https://github.com/zsh-users/zsh-autosuggestions.git"
  fetch_external ~/.oh-my-zsh/custom/themes/spaceship-prompt "https://github.com/denysdovhan/spaceship-prompt.git"
  ln -sf ~/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/themes/spaceship.zsh-theme

  if [ ! -z "$rbenv" ]; then
    notice "Updating rbenv"
    fetch_external ~/.rbenv "https://github.com/sstephenson/rbenv.git"
    fetch_external ~/.rbenv/plugins/ruby-build "https://github.com/sstephenson/ruby-build.git"
    fetch_external ~/.rbenv/plugins/rbenv-vars "https://github.com/sstephenson/rbenv-vars.git"
  fi
}

if [ ! -f ./install.sh ] || [ ! -f ./bootstrap.sh ]; then
  error "Are you in the dotfiles directory?"
  exit 1
fi

externals
install
