#!/bin/bash

DEFAULT_COLOR="#f5f3f4"

session_name=$(/opt/homebrew/bin/tmux display-message -p '#S')

case "$session_name" in
    "r")
        foreground_color="#FF9999" # red
        ;;
    "g")
        foreground_color="#77DD77" # green
        ;;
    "b")
        foreground_color="#99CCFF" # blue
        ;;
    "y")
        foreground_color="#FFEB99" # yellow
        ;;
    "p")
        foreground_color="#CBA6E3" # purple
        ;;
    *)
        foreground_color="$DEFAULT_COLOR"
        ;;
esac

sed -i '' "s/^foreground = '.*'/foreground = '$foreground_color'/" /Users/david/@/dot/.alacritty.toml
