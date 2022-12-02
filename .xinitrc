xrdb ~/.Xresources

xsetroot -cursor_name left_ptr

setxkbmap -layout "us,lt,ru" -option "grp:alt_shift_toggle"

/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &

dunst &

nitrogen --restore

trayer --edge top --align right --SetDockType true --SetPartialStrut true \
 --expand true --width 10 --transparent true --tint 0x5f5f5f --height 18 &

exec $HOME/.cache/xmonad/xmonad-x86_64-linux
