#!/bin/bash

# Make .bash and .bash/variables directories if they don't exist.
mkdir -p ~/.bash/variables

# Copy variables files.
cp variables/* ~/.bash/variables/

if [[ $(uname) == 'Darwin' ]]; then

  # Add OS X specific settings and output .bash_profile to user's home
  # direcotry.
  cat .bash_profile osx.bash > ~/.bash_profile

  # Install Fish
  brew install fish curl

else
  if [[ $(uname) == 'Linux' ]]; then

    # Copy .bash_profile to current user's directory.
    cp .bash_profile ~/.bash_profile

    # Install Fish
    sudo apt-get install -y fish curl

  fi
fi

if [[ $(uname) == 'Darwin' ]] || [[ $(uname) == 'Linux' ]]; then

  # Add Fish to list of shells.
  if grep -Fxq "/usr/local/bin/fish" /etc/shells; then
    echo "Fish already added to list of shells"
  else
    echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
  fi

  # Change default shell to Fish.
  sudo chsh -s /usr/local/bin/fish

  # Install Fisherman plugin manager.
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher

  # Copy fishfile to Fish config directory.
  cp fishfile ~/.config/fish/fishfile

  # Run Fisherman to install missing dependencies.
  fish -c fisher

fi

if [[ $? == 0 ]]; then
  echo "Installed shell configurations successfully."
fi
