#!/usr/bin/env bash

set -euo pipefail

DOTFILES="$HOME/dotfiles/arch"

echo "======================================"
echo " Arch Development Environment Setup"
echo "======================================"
echo

if [[ ! -d "$DOTFILES" ]]; then
    echo "ERROR: Dotfiles directory not found:"
    echo "$DOTFILES"
    exit 1
fi

backup_dir="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

backup() {
    local path="$1"

    if [[ -e "$path" || -L "$path" ]]; then
        mkdir -p "$backup_dir/$(dirname "${path#$HOME/}")"
        mv "$path" "$backup_dir/${path#$HOME/}"
        echo "Backed up: $path"
    fi
}

link_file() {
    local source="$1"
    local target="$2"

    if [[ ! -e "$source" ]]; then
        echo "Skipping missing source: $source"
        return
    fi

    mkdir -p "$(dirname "$target")"

    if [[ -e "$target" || -L "$target" ]]; then
        if [[ "$(readlink -f "$target" 2>/dev/null || true)" == "$(readlink -f "$source")" ]]; then
            echo "Already linked: $target"
            return
        fi

        backup "$target"
    fi

    ln -s "$source" "$target"
    echo "Linked: $target -> $source"
}

echo "[1/5] Updating Arch"
sudo pacman -Syu --noconfirm

echo
echo "[2/5] Installing packages"

mapfile -t packages < <(
    grep -vE '^[[:space:]]*#|^[[:space:]]*$' \
        "$DOTFILES/packages/pacman.txt"
)

sudo pacman -S --needed --noconfirm "${packages[@]}"

echo
echo "[3/5] Installing AUR packages"

if command -v yay >/dev/null 2>&1; then

    if [[ -f "$DOTFILES/packages/aur.txt" ]]; then

        mapfile -t aur_packages < <(
            grep -vE '^[[:space:]]*#|^[[:space:]]*$' \
                "$DOTFILES/packages/aur.txt"
        )

        if (( ${#aur_packages[@]} > 0 )); then
            yay -S --needed --noconfirm "${aur_packages[@]}"
        fi
    fi

else
    echo "yay not installed."
    echo "Skipping AUR packages."
fi

echo
echo "[4/5] Installing configuration"

# Zsh
link_file \
    "$DOTFILES/zsh/.zshrc" \
    "$HOME/.zshrc"

link_file \
    "$DOTFILES/zsh/.zprofile" \
    "$HOME/.zprofile"

link_file \
    "$DOTFILES/zsh/.p10k.zsh" \
    "$HOME/.p10k.zsh"


# tmux
link_file \
    "$DOTFILES/tmux/tmux.conf" \
    "$HOME/.config/tmux/tmux.conf"


# Neovim
if [[ -d "$DOTFILES/nvim" ]]; then

    if [[ -e "$HOME/.config/nvim" || -L "$HOME/.config/nvim" ]]; then
        if [[ "$(readlink -f "$HOME/.config/nvim" 2>/dev/null || true)" != "$(readlink -f "$DOTFILES/nvim")" ]]; then
            backup "$HOME/.config/nvim"
        fi
    fi

    mkdir -p "$HOME/.config"

    if [[ ! -L "$HOME/.config/nvim" ]]; then
        ln -s "$DOTFILES/nvim" "$HOME/.config/nvim"
    fi

    echo "Linked: ~/.config/nvim -> $DOTFILES/nvim"
fi


# Git
link_file \
    "$DOTFILES/git/.gitconfig" \
    "$HOME/.gitconfig"


echo
echo "[5/5] Configuring shell"

if [[ "$SHELL" != "/usr/bin/zsh" ]]; then
    echo "Changing default shell to zsh..."
    chsh -s /usr/bin/zsh
else
    echo "zsh is already the default shell."
fi

echo
echo "======================================"
echo " Setup complete"
echo "======================================"
echo

if [[ -d "$backup_dir" ]]; then
    echo "Previous configuration was backed up to:"
    echo "$backup_dir"
    echo
fi

echo "Dotfiles:"
echo "$DOTFILES"
echo

echo "Restart your terminal or log out/in."
