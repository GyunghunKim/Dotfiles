#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

## Purpose asking script
#read -p "Purpose  : " PURPOSE
#read -p "Time(min): " MINUTES
#
#export PURPOSE
#export MINUTES
######################################

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

# For vivado
export _JAVA_AWT_WM_NONREPARENTING=1
#

if systemctl -q is-active graphical.target && [[ !
$DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi
