#!/bin/bash
case "$1" in
  true)
	zenity --info --title="AC_UNPLUGGED" --text="AC_UNPLUGGED"
#sudo s2ram
	;;
  false)
	echo "no"
	;;
esac
exit 0

