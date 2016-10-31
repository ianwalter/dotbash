# Identifies vim as the default editor for programs like git.
export VISUAL=vim
export EDITOR="$VISUAL"

# Show colors for ls
export CLICOLOR=1

# Avoid duplicates in history
export HISTCONTROL=ignoredups:erasedups

# Show datetime in history
export HISTTIMEFORMAT="%d/%m/%y %T "

# Enable colors on XTerm.
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi
