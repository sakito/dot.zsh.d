#!/bin/env zsh

# peco
function peco-select-history() {
    local tac
    if which tac > /dev/null;
    then
        tac="tac"
    elif which gtac > /dev/null;
    then
        tac="gtac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        awk '!a[$0]++' | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
if which peco > /dev/null;
then
    zle -N peco-select-history
    bindkey '^r' peco-select-history
else
    bindkey '^r' zaw-history
fi

function peco-select-port-upgrade() {
    sudo port upgrade $(port outdated | \
    pbcopy; pbpaste | \
    peco | \
    cut -f1 -d' ')
}
