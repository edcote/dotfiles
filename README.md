# dotfiles

My Very Own Dotfiles Repo

* bash setup

```
cp .inputrc .bashrc .bash_aliases .vimrc ~
```

* pathogen

```
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```

* bash-git-prompt

```
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
cp Single_line_Minimalist_Ascii.bgptheme ~/.bash-git-prompt/themes/
```

* other packages

```
packages=(
  clag
  clang-11
  clang-format-11
  make
  ncdu
  ripgrep
  tmux
  vim-nox
  virtualenv
)
sudo apt install "${packages[@]}"
```
