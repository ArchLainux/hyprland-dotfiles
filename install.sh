#!/usr/bin/env bash

HOME_CONFIG_DIR=${XDG_CONFIG_HOME:-$HOME/.config}
OLD_DOTS=${HOME}/old_configurations
THEME_DIR=/usr/share/themes/Catppuccin-Mocha-Standard-Lavender-Dark

printf "installing dependencies with paru...\n"
sleep 3
paru -S --needed - < deps.txt
clear

printf "backing up old configuration files to ~/old_configurations...\n"
sleep 3
mkdir -p ${OLD_DOTS}
for dot in alacritty background btop cava gtk-3.0 gtk-4.0 hypr Kvantum mako mpd neofetch nvim obs-studio qt{5,6}ct rofi waybar ; do
  if [ -d "${HOME_CONFIG_DIR}/${dot}" ]; then
    mv ${HOME_CONFIG_DIR}/${dot} ${OLD_DOTS}/${dot}
  fi
done
if [ -d "/etc/sddm.conf.d" ]; then
  sudo mv /etc/sddm.conf.d ${OLD_DOTS}/sddm.conf.d
fi
if [ -d "/usr/share/sddm/themes/sugar-candy" ]; then
  sudo mv /usr/share/sddm/themes/sugar-candy ${OLD_DOTS}/sugar-candy
fi
sudo cp /etc/pacman.conf ${OLD_DOTS}/pacman.conf
cp ${HOME}/.zshrc ${HOME}/.face ${OLD_DOTS}
clear

printf "copying new dots...\n"
sleep 3
for dot in alacritty background btop cava gtk-3.0 hypr Kvantum mako mpd neofetch nvim obs-studio qt{5,6}ct rofi waybar ; do
  cp -r config/${dot} ${HOME_CONFIG_DIR}/${dot}
done
cp -f .zshrc .face ${HOME}
yes | sudo cp -rf etc/* /etc
sudo cp -rf usr/* /usr/share/sddm/themes
clear

printf "configuring gtk4...\n"
sleep 3
mkdir ${HOME_CONFIG_DIR}/gtk-4.0
ln -sf "${THEME_DIR}/gtk-4.0/assets" "${HOME_CONFIG_DIR}/gtk-4.0/assets"
ln -sf "${THEME_DIR}/gtk-4.0/gtk.css" "${HOME_CONFIG_DIR}/gtk-4.0/gtk.css"
ln -sf "${THEME_DIR}/gtk-4.0/gtk-dark.css" "${HOME_CONFIG_DIR}/gtk-4.0/gtk-dark.css"
clear

printf "finalizing...\n"
sleep 3
for script in backlight dnd lang volume ; do
  chmod u+x ${HOME_CONFIG_DIR}/hypr/scripts/${script}
done
chmod u+x ${HOME_CONFIG_DIR}/rofi/rofi-power-menu
papirus-folders -C cat-mocha-lavender
sudo chsh -s /bin/zsh ${USER}
rm -rf ${HOME}/.local/share/nvim ${HOME}/.local/state/nvim
clear

printf "done restart your session now :)\n"
