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
  apt-transport-https
  clang-11
  clang-format-11
  curl
  gnupg
  make
  ncdu
  pylint
  python3-pip
  ripgrep
  shellcheck
  tmux
  vim-nox
  virtualenv
  yapf
)
sudo apt install "${packages[@]}"
```

* pyformat

`pip install pyformat`

* bazel

```
curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor > bazel.gpg
sudo mv bazel.gpg /etc/apt/trusted.gpg.d/
echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
sudo apt update && sudo apt install bazel
```

* octave

`snap install octave`
