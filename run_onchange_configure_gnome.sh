#!/bin/sh
# This script configures GNOME settings via gsettings.
# It runs automatically on `chezmoi apply` if the script itself changes.

echo "Configuring GNOME focus-mode and custom shortcuts..."

# 1. Set Focus Follows Mouse
gsettings set org.gnome.desktop.wm.preferences focus-mode 'sloppy'

# Reset default GNOME run dialog keybinding to Alt+F2 to avoid conflict with Super+r
gsettings set org.gnome.desktop.wm.keybindings panel-run-dialog "['<Alt>F2']"

# 2. Set Background (use wallpaper.png if exists, else solid black)
wallpaper_file="${HOME}/wallpaper.png"
if [ -f "${wallpaper_file}" ]; then
  echo "Wallpaper file found: ${wallpaper_file}. Setting as background..."
  gsettings set org.gnome.desktop.background picture-uri "file://${wallpaper_file}"
  gsettings set org.gnome.desktop.background picture-uri-dark "file://${wallpaper_file}"
  gsettings set org.gnome.desktop.background picture-options 'scaled'
  gsettings set org.gnome.desktop.background primary-color '#000000'
else
  echo "No wallpaper file found at ${wallpaper_file}. Setting solid black background..."
  gsettings set org.gnome.desktop.background picture-uri ''
  gsettings set org.gnome.desktop.background picture-uri-dark ''
  gsettings set org.gnome.desktop.background primary-color '#000000'
  gsettings set org.gnome.desktop.background color-shading-type 'solid'
fi

# 3. Define Custom Keybindings List
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "[ \
  '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', \
  '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/', \
  '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/', \
  '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/', \
  '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/', \
  '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/' \
]"

# 4. Configure Custom Keybindings
# custom0: Terminal (Alacritty)
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command '/usr/bin/alacritty'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Super>e'

# custom1: Vim (GVim Wayland)
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name 'vim'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command '/usr/local/google/home/ecote/bin/gvim_wayland'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding '<Super>g'

# custom2: Chrome Wayland (new window)
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ name 'Chrome'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ command '/opt/google/chrome/google-chrome --ozone-platform-hint=wayland --new-window'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ binding '<Super>i'

# custom3: Python in Alacritty
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ name 'Python'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ command 'alacritty -e python3'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ binding '<Super>c'

# custom4: Cider-V
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ name 'Cider-V'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ command '/opt/google/chrome/google-chrome --ozone-platform-hint=wayland --app=https://cider-v.corp.google.com/?ws=__prompt'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ binding '<Super>v'

# custom5: Run in Terminal
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/ name 'Run in Terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/ command '/usr/local/google/home/ecote/bin/run_in_terminal.sh'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/ binding '<Super>r'

# 5. Enable GNOME Shell Extensions
gnome-extensions enable window-calls@domandoman.xyz
gnome-extensions enable space-bar@luchrioh

echo "GNOME configuration applied."
