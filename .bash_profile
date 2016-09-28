# Make Tab autocomplete regardless of filename case
set completion-ignore-case on

# List all matches in case multiple possible completions are possible
set show-all-if-ambiguous on

# Show all autocomplete results at once
set page-completions off

# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

# Source environment variable files.
for file in ~/.bash/variables/*.bash; do
	[ -r "$file" ] && [ -f "$file" ] && . "$file";
done;

unset file;
