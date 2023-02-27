#!/bin/env zsh

# Emacs 用

# @see http://masutaka.net/chalow/2011-09-28-1.html
# ディレクトリを Emacs の dired で開く
function dired () {
    emacsclient -e "(dired \"${1:a}\")"
}

# emacs 側に設定が必要です init_elscreen に関数を定義してあります
function cde () {
    EMACS_CWD=`emacsclient -e "
    (if (featurep 'elscreen)
    (elscreen-current-directory)
    (non-elscreen-current-directory))" | sed 's/^"\(.*\)"$/\1/'`

    echo "chdir to $EMACS_CWD"
    cd "$EMACS_CWD"
}

# end
