#!/bin/bash

# Make .bash and .bash/variables directories if they don't exist.
mkdir -p ~/.bash/variables

# Copy variables files.
cp variables/* ~/.bash/variables/

if [[ $(uname) == 'Darwin' ]]; then

  # Add OS X specific settings and output .bash_profile to user's home
  # direcotry.
  cat .bash_profile osx.bash > ~/.bash_profile

else
  if [[ $(uname) == 'Linux' ]]; then

    # Copy .bash_profile to current user's directory.
    cp .bash_profile ~/.bash_profile

    # Install zsh
    sudo apt-get install -y zsh

  fi
fi

# Copy .zshrc to current user's directory.
cp .zshrc ~/.zshrc

# Install the Pure prompt if NPM is installed.
if [ `which npm` ]; then
  npm install -g pure-prompt
fi

if [[ $? == 0 ]]; then
  echo "Installed shell configurations successfully."
fi
