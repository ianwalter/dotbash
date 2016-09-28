# Source environment variable files.
for file in ~/.bash/variables/*.bash; do
	[ -r "$file" ] && [ -f "$file" ] && . "$file";
done;

autoload -U promptinit; promptinit && prompt pure
