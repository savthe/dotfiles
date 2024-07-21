#!/bin/bash

CURRENT_MODE=$(gsettings get org.gnome.desktop.interface color-scheme)

# Toggle logic based on current mode
if [ "$CURRENT_MODE" = "'prefer-dark'" ]; then
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
  sed -i "s/dark.yaml/light.yaml/" ~/.config/alacritty/alacritty.yml
  sed -i "s/dark.tmux/light.tmux/" ~/.tmux.conf
  sed -i "s/color_theme=\"dracula\"/color_theme=\"flat-remix-light\"/" ~/.config/bpytop/bpytop.conf
  export BAT_THEME=Coldark-Cold
else
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
  sed -i "s/light.yaml/dark.yaml/" ~/.config/alacritty/alacritty.yml
  sed -i "s/light.tmux/dark.tmux/" ~/.tmux.conf
  sed -i "s/color_theme=\"flat-remix-light\"/color_theme=\"dracula\"/" ~/.config/bpytop/bpytop.conf
  export BAT_THEME=Dracula
fi

tmux source ~/.tmux.conf
