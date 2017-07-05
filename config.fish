# Tell other programs like git to use vim as the default editor.
set -x EDITOR 'vim'
set -x VISUAL 'vim'

# Configuration for the history command.
set -x HISTTIMEFORMAT '%d/%m/%y %T '
set -x HISTCONTROL 'ignoredups:erasedups'

# Set Golang path.
set -x GOPATH $HOME/go
set -x PATH $GOPATH/bin $PATH

# Move files to trash instead of completely removing them.
alias rm="trash"
