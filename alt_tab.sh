#!/bin/bash

DEFAULT_COLOR="#f5f3f4"

session_name=$(tmux display-message -p '#S')

case "$session_name" in
    "r")
        tmux switch-client -t p
        foreground_color="#CBA6E3" # purple
        ;;
    "g")
        tmux switch-client -t r
        foreground_color="#FF9999" # red
        ;;
    "b")
        tmux switch-client -t g
        foreground_color="#77DD77" # green
        ;;
    "y")
        tmux switch-client -t b
        foreground_color="#99CCFF" # blue
        ;;
    "p")
        tmux switch-client -t y
        foreground_color="#FFEB99" # yellow
        ;;
    *)
        foreground_color="$DEFAULT_COLOR"
        ;;
esac

sed -i "s/^foreground = '.*'/foreground = '$foreground_color'/" ~/.alacritty.toml
