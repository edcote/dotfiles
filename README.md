# My dotfiles README

## chezmoi

Clear the state of all `run_onchange_` and `run_once_` scripts:

```
$ chezmoi state delete-bucket --bucket=scriptState
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

