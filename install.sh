#!/bin/bash

# Install trash CLI program if NPM is installed.
if [ `which npm` ]; then
  npm install -g trash-cli
fi

# Copy fish configuration to the configuration directory
cp fishfile ~/.config/fish/fishfile
cp config.fish ~/.config/fish/config.fish

if [[ $(uname) == 'Darwin' ]]; then

  # Add OS X specific configuration to the configuration directory.
  cp osx.fish ~/.config/fish/osx.fish

  # Install Fish.
  brew install fish curl

else
  if [[ $(uname) == 'Linux' ]]; then

    # Install Fish.
    sudo apt-get install -y fish curl

  fi
fi

if [[ $(uname) == 'Darwin' ]] || [[ $(uname) == 'Linux' ]]; then

  if grep -Fxq "/usr/local/bin/fish" /etc/shells; then
    echo "Fish already added to list of shells"
  else

    # Add Fish to list of shells.
    echo "/usr/local/bin/fish" | sudo tee -a /etc/shells

    # Change default shell to Fish.
    chsh -s /usr/local/bin/fish

  fi

  # Install Fisherman plugin manager.
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher

  # Run Fisherman to install missing dependencies.
  fish -c fisher

fi

if [[ $? == 0 ]]; then
  echo "Installed fish configuration successfully."
fi
