#!/usr/bin/env bash

echo "Checking for oh-my-zsh install"
if [[ -d "$HOME/.oh-my-zsh" ]]; then
  echo "Oh My Zsh already installed"
else
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

echo "Symlinking dotfiles to home directory"

# Silence pushd/popd
pushd () {
    command pushd "$@" > /dev/null
}

popd () {
    command popd "$@" > /dev/null
}

# Get Script Directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
pushd $DIR

# Ignore . & .. during file glob
GLOBIGNORE=.

# Grab all .files
FILES=".*"

# Ignore certain files
IGNORE=(".gitignore")

# For each file, symlink to home directory
for f in $FILES; do

  if [[ -d $f ]]; then
    echo "Skipping directory $f"
    continue
  fi
  
  if [[ " ${IGNORE[@]} " =~ " ${f} " ]]; then
    echo "Skipping file $f"
    continue
  fi

  f_source="$DIR/$f"
  f_dest="$HOME/$f"
  echo "Linking $f from $f_source to $f_dest"

  if [[ -f $f_dest ]]; then
    echo "$f_dest already exists, replacing"
    rm $f_dest
  fi

  if [[ -L $f_dest ]]; then
    echo "$f_dest is already a symlink, replacing with new symlink"
    rm $f_dest
  fi

  ln -s $f_source $f_dest
done

popd
