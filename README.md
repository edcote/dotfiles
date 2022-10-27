# My dotfiles README

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

https://extensions.gnome.org/extension/5090/space-bar/

## Go packages

```
go install github.com/bazelbuild/bazelisk@latest
go install github.com/bazelbuild/buildtools/buildifier@latest
```

## Themes

-   https://github.com/sonph/onehalf

## Visual Studio Code

### Location of settings files

-   VS Code

    -   `${HOME}/.config/Code/User/settings.json`
    -   `%APPDATA%\Roaming\Code\User\settings.json` (Windows)

-   Visual Studio Code Server

    -   `${HOME}/.local/share/code-server/User/settings.json
    -   `${HOME}/.local/share/code-server/User/keybindings.json

Use
[SSH port forwarding](https://github.com/coder/code-server/blob/main/docs/guide.md)
to access.

-   VS Code Remote Development

    -   `${HOME}/.vscode-server/data/Machine/settings.json`
