#!/bin/env zsh

# Erlang関連

function ercrun {
    if [ $# -gt 0 ];
    then
        erl -noshell -s $@ -s init stop
    fi
}
