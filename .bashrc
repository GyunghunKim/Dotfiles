#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

cat ~/.cache/wal/sequences &

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -drx

alias ls='ls --color=auto'
alias ll='ls --color=auto -al'
alias pacinstall='sudo pacman -Syu'

PS1='[\u@\h \W]\$ '
