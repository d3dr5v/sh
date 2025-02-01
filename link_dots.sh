#!/bin/bash

DOTS="~/@/dot"

if [ ! -d "$DOTS" ]; then
  echo "Error: The source directory $DOTS does not exist."
  exit 1
fi

for file in "$DOTS"/.*; do
  if [ -f "$file" ]; then
    filename=$(basename "$file")

		rm "$HOME/$filename"

    ln -sf "$file" "$HOME/$filename"

    echo "Linked $filename to $HOME/"
  fi
done

echo "All dot files have been linked."

