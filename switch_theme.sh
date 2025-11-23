#!/bin/bash

THEME_DIR="$HOME/.config/alacritty/themes"
MAIN_CONFIG="$HOME/.config/alacritty/alacritty.toml"

# Tema listesini al
SELECTED=$(ls "$THEME_DIR"/*.toml | xargs -n1 basename | fzf --prompt="Tema seç: ")

[ -z "$SELECTED" ] && exit 0

THEME_FILE="$THEME_DIR/$SELECTED"

# Önce en üstteki import/comment edilmiş import satırını bulalım
if grep -q "^#\?general\.import" "$MAIN_CONFIG"; then
    # Satırı güncelle (yorumu yok sayıp aktif hale getirir)
    sed -i "s|^#\?general\.import.*|general.import = [\"$THEME_FILE\"]|" "$MAIN_CONFIG"
else
    # En üstte import yoksa başa ekle
    sed -i "1i general.import = [\"$THEME_FILE\"]\n" "$MAIN_CONFIG"
fi

echo "Tema uygulandı: $SELECTED"
