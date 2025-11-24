#!/bin/bash

DEFAULT_COLOR="#f5f3f4"

session_name=$(/nix/store/3ac7m1dbzd54c6ygv0g880zbmw7dhhg3-tmux-3.5a/bin/tmux display-message -p '#S')

case "$session_name" in
    "r")
        /nix/store/3ac7m1dbzd54c6ygv0g880zbmw7dhhg3-tmux-3.5a/bin/tmux switch-client -t p
        foreground_color="#CBA6E3" # purple
        ;;
    "g")
        /nix/store/3ac7m1dbzd54c6ygv0g880zbmw7dhhg3-tmux-3.5a/bin/tmux switch-client -t r
        foreground_color="#FF9999" # red
        ;;
    "b")
        /nix/store/3ac7m1dbzd54c6ygv0g880zbmw7dhhg3-tmux-3.5a/bin/tmux switch-client -t g
        foreground_color="#77DD77" # green
        ;;
    "y")
        /nix/store/3ac7m1dbzd54c6ygv0g880zbmw7dhhg3-tmux-3.5a/bin/tmux switch-client -t b
        foreground_color="#99CCFF" # blue
        ;;
    "p")
        /nix/store/3ac7m1dbzd54c6ygv0g880zbmw7dhhg3-tmux-3.5a/bin/tmux switch-client -t y
        foreground_color="#FFEB99" # yellow
        ;;
    *)
        foreground_color="$DEFAULT_COLOR"
        ;;
esac

sed -i "s/^foreground = '.*'/foreground = '$foreground_color'/" ~/.alacritty.toml
