# Make Tab autocomplete regardless of filename case
set completion-ignore-case on

# List all matches in case multiple possible completions are possible
set show-all-if-ambiguous on

# Show all autocomplete results at once
set page-completions off

# Source environment variable files.
for file in ~/.bash/; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

unset file;
