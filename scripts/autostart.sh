#!/usr/bin/env bash
# Autostart script for Wayfire

function spawn() {
    "$@" & disown
}

# Shell components
spawn env XDG_CURRENT_DESKTOP=wayfire \
      XDG_SESSION_TYPE=wayland \
      XDG_SESSION_DESKTOP=wayfire \
      dbus-update-activation-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
spawn wf-background
spawn /usr/libexec/xdg-desktop-portal-wlr
spawn env LD_PRELOAD="/usr/lib/x86_64-linux-gnu/libgtk-layer-shell.so" waybar
spawn "$HOME/.config/wayfire/scripts/wrapper.sh"
spawn mako --background-color "#000000" --border-color "#000000" --output DP-3
spawn "$HOME/.config/wayfire/scripts/start-replay.sh"
spawn gsettings set org.gnome.desktop.interface gtk-theme Adwaita:dark
spawn python3 "$HOME/.config/wayfire/scripts/ipc-scripts/firefox-pip-sticky.py"

# User apps
spawn zen
spawn "$HOME/.local/share/Discord/Discord"
spawn keepassxc
spawn SFP_UI
spawn "$HOME/.config/wayfire/scripts/musicplayer-startup.sh"

exit
