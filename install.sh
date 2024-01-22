#!/bin/sh

echo "Making XDG user directories.."
mkdir -p \
	"$HOME/.local/bin" \
	"$HOME/.config" \
	"$HOME/.local/share" \
	"$HOME/.local/state"

for program in "curl git"; do
	if ! command -v $program >/dev/null 2>&1; then
		echo "$program not found. Please make sure it is installed before continuing.."
		exit 1
	fi
done

if [ ! -e $ZSH_CUSTOM ]; then
	echo "Couldn't find .oh-my-zsh. Installing.."
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	rm "$HOME/.zshrc"

	echo "Installing Zsh plugins.."
	git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete
	git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
	git clone https://github.com/z-shell/F-Sy-H.git ${ZSH_CUSTOM}/plugins/F-Sy-H
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
