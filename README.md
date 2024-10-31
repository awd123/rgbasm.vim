# rgbasm.vim

## Description

This project consists of Vim syntax and ftplugin files for RGBDS-style Game Boy
Z80 assembly language.

## Installation

On Vim 8.0+, this plugin can be installed by simply copying the `rgbasm.vim`
files from each of the `ftdetect`, `ftplugin`, and `syntax` directories into
their respective directories under your Vim runtime directory (`~/.vim/` by
default on Unix-like systems).

### install-plugin.sh

This shell script is provided to install the relevant files into your Vim
runtime automatically. The script attempts to install the plugin files into
`~/.vim/` by default, but an alternate directory can be provided as a
command-line argument in case your runtime is located in a non-default
directory.
