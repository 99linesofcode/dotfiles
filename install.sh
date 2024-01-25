#!/bin/sh

echo "Making XDG user directories.."
mkdir -p \
	$HOME/.local/bin \
	$HOME/.config \
	$HOME/.local/share \
	$HOME/.local/state

for program in "curl git"; do
	if ! command -v $program >/dev/null 2>&1; then
		echo "$program not found. Please make sure it is installed before continuing.."
		exit 1
	fi
done

if [ -z ${ZSH_CUSTOM:="${HOME}/.oh-my-zsh"} ]; then
	echo "Couldn't find Oh-My-Zsh. Installing.."
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	rm "${HOME}/.zshrc"

	echo "Installing Zsh plugins.."
	git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete
	git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
	git clone https://github.com/z-shell/F-Sy-H.git $ZSH_CUSTOM/plugins/F-Sy-H
fi

if [ ! -e $ASDF_DIR ]; then
	echo "Couldn't find Asdf. Installing.."
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf
fi

if ! command -v "nvim" >/dev/null 2>&1; then
	echo "Couldn't find Neovim. Installing.."

	if [ -z $ASDF_DIR ]; then
		export ASDF_DIR="$HOME/.asdf"
	fi

	. $HOME/.asdf/asdf.sh
	asdf plugin add neovim
	asdf install neovim stable
	asdf global neovim stable
	ln -sf $(which nvim) $HOME/.local/bin/vi
	ln -sf $(which nvim) $HOME/.local/bin/vim
fi

echo "Creating symbolic links in $HOME and $HOME/.config.."
for item in .[^.]* .config/*; do
	if [ "$item" = ".config" ] || [ "$item" = ".git" ]; then
		continue
	fi

	target_filepath="$HOME/$item"

	if [ ! -L target_filepath ] || [ ! -e target_filepath ]; then
		echo "$target_filepath symbolic link already exists. Skipped."
		continue
	fi

	ln -sf "$(pwd)/$item" ${target_filepath%/*}
	echo "$(pwd)/$item" ${target_filepath%/*}
done

echo "Done!"
