#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

cat ~/.cache/wal/sequences

alias ls='ls --color=auto'
alias ll='ls --color=auto -al'
alias pacinstall='sudo pacman -S'
alias _posts='vim ~/Workspace/gyunghunkim.github.io/_posts'
alias conda_activate='source /opt/anaconda/bin/activate root'
alias matlab_desktop='matlab -desktop & disown'

alias kakaotalk="nohup ~/.wine/drive_c/'Program Files (x86)'/Kakao/KakaoTalk/KakaoTalk.exe 2>&1 &"

alias cdhw='cd ~/Workspace/MC/HW2'


PS1='\[\e[34;1m\]\u\[\e[32;1m\]@\h \[\e[33;1m\]\w\$ \[\e[0m\]'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ghkim/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ghkim/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/ghkim/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/ghkim/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

