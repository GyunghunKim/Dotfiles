#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Purpose asking script
read -p "Purpose  : " PURPOSE
read -p "Time(min): " MINUTES

export PURPOSE
export MINUTES
#####################################


if systemctl -q is-active graphical.target && [[ !
$DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi
