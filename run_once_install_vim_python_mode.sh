#!/bin/bash -e

mkdir -p ~/.vim
cd ~/.vim
mkdir -p bundle
cd bundle
rm -rf python-mode
git clone --quiet --recurse-submodules https://github.com/python-mode/python-mode.git
