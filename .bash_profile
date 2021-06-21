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

# Conda init
export TERMINFO=/usr/share/terminfo
# << Conda init

# Ruby init
if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -e 'puts Gem.user_dir')/bin:$PATH"
fi
# << Ruby init

# Xilinx init
source /tools/Xilinx/Vitis/2020.2/settings64.sh
source /tools/Xilinx/Vivado/2020.2/settings64.sh
# << Xilinx init

if systemctl -q is-active graphical.target && [[ !
$DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi
