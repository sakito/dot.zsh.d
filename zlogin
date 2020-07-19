# -*- mode:sh -*-

#screen-UxR
#if [ $TERM = "screen" ]; then
#    precmd () {
#        screen -xR title $(basename $(print -P "%~"))
#    }
#    preexec () {
#        screen -xR eval "title '$1'"
#    }
#fi
#if [ $TERM != screen ]; then
#   exit
#fi

# Attache tmux
if ( ! test $TMUX ) && ( ! expr $TERM : "^screen" > /dev/null ) && which tmux > /dev/null; then
    if ( tmux has-session ); then
        session=`tmux list-sessions | grep -e '^[0-9].*]$' | head -n 1 | sed -e 's/^\([0-9]\+\).*$/\1/'`
        if [ -n "$session" ]; then
            echo "Attache tmux session $session."
            tmux attach-session -t $session
        else
            echo "Session has been already attached."
            tmux list-sessions
        fi
    else
        echo "Create new tmux session."
        tmux new-session -n $(hostname -s)
    fi
fi
