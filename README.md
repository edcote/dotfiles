# My dotfiles README

## chezmoi

Clear the state of all `run_onchange_` and `run_once_` scripts:

```
$ chezmoi state delete-bucket --bucket=scriptState
```

## GNOME

To export: `dconf dump / > dconf_gnome.ini`

To import: `dconf load / < dconf_gnome.ini`

Apply manual settings:

```
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 4
gsettings set org.gnome.desktop.wm.preferences workspace-names "['rdo0', 'rdo1', 'rdo1', 'rdo3']"
```

### Shell extensions

- https://extensions.gnome.org/extension/5090/space-bar/
- https://github.com/home-sweet-gnome/dash-to-panel
- https://github.com/Leleat/Tiling-Assistant

### Location of settings files

- VS Code
  - `${HOME}/.config/Code/User/settings.json` (Linux)
  - `%APPDATA%\Roaming\Code\User\settings.json` (Windows)

- VS Code Server

Start service using: `sudo systemctl enable --now code-server@$USER`

Upgrade using: `sudo curl -fsSL https://code-server.dev/install.sh | sh -s -- --method=standalone`

Use
[SSH port forwarding](https://github.com/coder/code-server/blob/main/docs/guide.md)
to access `-L 8080:127.0.0.1:8080`

