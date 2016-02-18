#!/bin/bash

# Make .bash and .bash/variables directories if they don't exist.
mkdir -p ~/.bash/variables

# Copy variables files.
cp variables/* ~/.bash/variables/


if [[ $(uname) == 'Darwin' ]]; then

  #
  cat .bash_profile osx.bash_profile > ~/.bash_profile

else if [[ $(uname) == 'Linux' ]]; then

  # Copy .bash_profile to current user's directory.
  cp .bash_profile ~/.bash_profile

fi

# Source .bash_profile so that commands are executed immediately.
source ~/.bash_profile

if [[ $? == 0 ]]; then
  echo "Installed bash configuration successfully."
fi
