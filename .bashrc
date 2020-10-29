#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

cat ~/.cache/wal/sequences &

alias ls='ls --color=auto'
alias ll='ls --color=auto -al'
alias pacinstall='sudo pacman -Syu'

PS1='[\u@\h \W]\$ '
