cat ~/.cache/wal/sequences

if status is-login
    read -p 'echo "Purpose  : "' PURPOSE
    read -p 'echo "Time(min): "' MINUTES

    set -x PURPOSE $PURPOSE
    set -x MINUTES $MINUTES

    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx
    end
end

function pacinstall -d "Package installation with pacman"
    command sudo pacman -S $argv
end

function ll -d "long list"
    ls -al
end
