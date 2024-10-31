#!/bin/sh

# try to read first argument for Vim runtime directory
DIR=""
if [ -n "$1" ]; then
  DIR="$1"
elif [ -n "$HOME" ]; then
  DIR="$HOME/.vim/"
else
  echo "No argument provided and cannot find user's home directory. Exiting..."
  exit 1
fi

# create folders, if they don't exist
mkdir -p "$DIR/ftdetect"
mkdir -p "$DIR/ftplugin"
mkdir -p "$DIR/syntax"

# copy files into the correct folders
cp ./ftdetect/rgbasm.vim "$DIR/ftdetect/rgbasm.vim"
cp ./ftplugin/rgbasm.vim "$DIR/ftplugin/rgbasm.vim"
cp ./syntax/rgbasm.vim "$DIR/syntax/rgbasm.vim"

echo "Installed plugin files in $DIR"
