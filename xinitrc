#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi


# Load the IME
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
fcitx

# Make CapsLock another Escape Key
xmodmap ~/.Xmodmap

# Activate Numlock
numlockx&

# MPD Settings
if [ -f /usr/bin/mpd ]; then
	# Start MPD if not already running
	[ ! -s ~/.local/share/mpd/pid ] && mpd /home/darko/.config/mpd/mpd.conf
	mpdscribble
	(mpd-random-pl-album.py -d > /tmp/mpd-random-pl-album.log 2>&1 ) &
fi

# Terminal Emulator Settings
xrdb -merge ~/.Xresources
# Open the WM
exec awesome
