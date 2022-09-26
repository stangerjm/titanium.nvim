#!/bin/bash

set -o nounset

# Ensure .config directory exists
[ ! -d ~/.config ] && mkdir ~/.config

# Path where neovim config lives
NvimConfigPath="$HOME/.config/nvim"

# Ensure .config/nvim directory exists
[ ! -d $NvimConfigPath ] && mkdir $NvimConfigPath

# If .config/nvim/lua directory exists, wipe it clean
[ -d "$NvimConfigPath/lua" ] && rm -rf "$NvimConfigPath"/lua

# Copy lua directory to .config/nvim
cp -R ./lua "$NvimConfigPath"

# Reload init.lua
[ -f "$NvimConfigPath/init.lua" ] && rm "$NvimConfigPath"/init.lua
cp ./init.lua "$NvimConfigPath"
