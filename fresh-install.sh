#! /bin/bash

echo "Install latest node"

nvm install --latest

echo "Neovim Plugins Support"

# Node

npm install -g tree-sitter-cli
npm install -g neovim

# Python

/usr/bin/python3 -m pip install pynvim

# Ruby

gem install neovim

# Perl

cpanm -n App::cpanminus
cpanm -n Neovim::Ext
