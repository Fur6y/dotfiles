# Load the shell dotfiles
for file in ~/dotfiles/{bash_prompt,bash_aliases,bash_functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;