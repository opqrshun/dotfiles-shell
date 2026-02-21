#!/usr/bin/env bash

LINK_SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES="${DOTFILES:-$(cd -- "$LINK_SCRIPT_DIR/.." && pwd)}"

backup_existing_target() {
    local target="$1"
    local stamp backup

    stamp="$(date +%Y%m%d%H%M%S)"
    backup="${target}.bak.${stamp}"

    while [ -e "$backup" ] || [ -L "$backup" ]; do
        stamp="${stamp}_1"
        backup="${target}.bak.${stamp}"
    done

    mv "$target" "$backup"
    echo "Backup existing target: ~${target#$HOME} -> ~${backup#$HOME}"
}

echo -e "Creating symlink"
linkables=$( find -H "$DOTFILES" -mindepth 1 -maxdepth 1 -name '.*' -not -name '.git*' -not -name '.config' -not -name '.kiro')
for file in $linkables ; do
    target="$HOME/$( basename "$file")"
    if [ -L "$target" ]; then
        linked="$(readlink "$target")"
        if [ "$linked" = "$file" ]; then
            echo "~${target#$HOME} already linked... Skipping."
            continue
        fi
        backup_existing_target "$target"
    elif [ -e "$target" ]; then
        backup_existing_target "$target"
    fi
    echo "Creating symlink for $file"
    ln -s "$file" "$target"
done

echo -e "Creating symlink to ~/.config"
if [ ! -d "$HOME/.config" ]; then
    echo "Creating ~/.config"
    mkdir -p "$HOME/.config"
fi

config_files=$( find "$DOTFILES/.config" -mindepth 1 -maxdepth 1 ! -name '*.bak.*' 2>/dev/null )
for config in $config_files; do
    target="${HOME}${config#$DOTFILES}"
    if [ -L "$target" ]; then
        linked="$(readlink "$target")"
        if [ "$linked" = "$config" ]; then
            echo "~${target#$HOME} already linked... Skipping."
            continue
        fi
        backup_existing_target "$target"
    elif [ -e "$target" ]; then
        backup_existing_target "$target"
    fi
    echo "Creating symlink for $config"
    ln -s "$config" "$target"
done
