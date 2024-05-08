## my personal hyprland on ArchBTW

### screenshots:
![desktop](https://telegra.ph/file/0d24a71021255bc5b3460.png)\
![hyprlock](https://telegra.ph/file/b97fbc483139a78afacfa.png)\
![sddm](https://telegra.ph/file/27fd817a415d2a539398a.png)

### how to use:
- install paru (an aur helper):
    ```bash
    sudo pacman -S --needed base-devel git
    git clone https://aur.archlinux.org/paru-bin.git
    cd paru-bin
    makepkg -si
    cd
    rm -rf paru-bin
    ```
- clone the repo:
    ```bash
    git clone https://github.com/ArchLainux/hyprland-dotfiles.git
    cd hyprland-dotfiles
    ```
- run the install script:
    ```bash
    chmod u+x install.sh
    ./install.sh
    ```
- *NOTE:*\
    you have to edit your monitor name in hyprland configuration files\
    check your monitor name by running:
    ```bash
    hyprctl monitors all
    ```

## special thanks
[hyprland](https://github.com/hyprwm/Hyprland) - for the best wayland window manager\
[catppuccin](https://github.com/catppuccin) - for the best theme ever\
[nvchad](https://github.com/NvChad/NvChad/tree/v2.0) - for the neovim base config\
[dreamsofcode-io](https://github.com/dreamsofcode-io) - for the best custom nvchad setup from the best youtuber ever :)\
[newmanls](https://github.com/newmanls/rofi-themes-collection) - for rofi style\
[jluttine](https://github.com/jluttine/rofi-power-menu) - for rofi power menu script\
[kangie](https://github.com/Kangie/sddm-sugar-candy) - for sddm theme\
[archwiki members](https://wiki.archlinux.org/title/Hyprland) - for mako scripts from their wiki\
[doprz](https://github.com/doprz/dipc) - for dipc :3
