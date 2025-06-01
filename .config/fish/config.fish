export NNN_BMS="c:$HOME/Documents/programs/;b:$HOME/Documents/Books/;s:$HOME/Documents/Study Materials/SEM-VI/;d:$HOME/Documents/;D:$HOME/Downloads/"

# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end
