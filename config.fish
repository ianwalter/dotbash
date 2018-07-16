# Tell other programs like git to use VS Code as the default editor.
set -x EDITOR 'code --wait'
set -x VISUAL 'code --wait'

# Configuration for the history command.
set -x HISTTIMEFORMAT '%d/%m/%y %T '
set -x HISTCONTROL 'ignoredups:erasedups'

# Fixing issue with VS Code deleting things on Linux.
set -x ELECTRON_TRASH 'gio'

# Set programming language paths.
if test -d ~/go
  set -x GOPATH ~/go
  set -x PATH $GOPATH/bin $PATH
end
if test -d ~/.composer
  set -x PATH ~/.composer/vendor/bin $PATH
end

# Move files to trash instead of completely removing them.
if which trash > /dev/null
  alias rm="trash"
end

# Add NPM default bin directory to $PATH if created during installation.
if test -d ~/.npm-global
  set -x PATH ~/.npm-global/bin $PATH
end

# Create pbcopy and pbpaste aliases if xclip is installed.
if which xclip > /dev/null
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
end

# Add thefuck support.
thefuck --alias | source
