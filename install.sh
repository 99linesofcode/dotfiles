#!/bin/sh

echo "Making XDG user directories.."
mkdir -p \
	"$HOME/.local/bin" \
	"$HOME/.config" \
	"$HOME/.local/share" \
	"$HOME/.local/state"

if [ ! -e "$HOME/.oh-my-zsh/" ]; then
	echo "Couldn't find .oh-my-zsh directory. Installing.."
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	rm "$HOME/.zshrc"
fi

echo "Creating symbolic links in $HOME and $HOME/.config.."
for item in .[^.]* .config/*; do
	if [ "$item" = ".config" ] || [ "$item" = ".git" ]; then
		continue
	fi

	target_filepath="$HOME/$item"
	ln -sf "$(pwd)/$item" ${target_filepath%/*}
	echo "$(pwd)/$item" ${target_filepath%/*}
done

if command -v "php" >/dev/null 2>&1; then
	if ! command -v "composer" >/dev/null 2>&1; then
		echo "Couldn't find Composer. Installing.."
		./scripts/install-composer.sh
	fi
fi

echo "Done!"
