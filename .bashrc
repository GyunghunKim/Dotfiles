#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

cat ~/.cache/wal/sequences

# Vivado
source /home/ghkim/Xilinx/Vivado/2020.2/settings64.sh
source /home/ghkim/Xilinx/Vitis/2020.2/settings64.sh 
# << Vivado

alias open='xdg-open'
alias ls='ls --color=auto'
alias ll='ls --color=auto -al'
alias pacinstall='sudo pacman -S'
alias vivado='vivado && rm -rf ~/vivado*'
alias vitis='vitis && rm -rf ~/vitis*'
alias _posts='vim ~/Workspace/gyunghunkim.github.io/_posts'

PS1='[\u@\h \W]\$ '
# added by Anaconda3 5.3.1 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/home/ghkim/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/home/ghkim/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/ghkim/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/home/ghkim/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

# Ruby init
if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -e 'puts Gem.user_dir')/bin:$PATH"
fi
# << Ruby init


