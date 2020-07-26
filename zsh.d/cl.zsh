#!/bin/env zsh

# Common Lisp 用

# ccl
function ccl() {
    BREAK_CHARS="(){}[],^%$#@\"\";''|\\"
    ccl="rlwrap -pgreen -r -m --history-filename=${HOME}/.ccl/ccl_history --histsize=1000000 -c -b ${BREAK_CHARS} -f ${HOME}/.ccl/ccl_completions ccl64 -K utf-8"
    if [ "$1" = "--script" ]; then
        $ccl --load "$2" --eval '(ccl:quit)'
    else
        $ccl $@
    fi
}

# sbcl
function sbcl() {
    BREAK_CHARS="(){}[],^%$#@\"\";''|\\"
    RLWRAP=""
    if [ $TERM = "dumb" ]; then  # slime
        RLWRAP=""
    else
        RLWRAP="rlwrap -pgreen -r -m --history-filename=${HOME}/.sbcl/sbcl_history --histsize=1000000 -c -b ${BREAK_CHARS} -f ${HOME}/.sbcl/sbcl_completions"
    fi
    if [ $# -eq 0 ]; then
        $RLWRAP sbcl
    else # permits #!/usr/bin/env sbcl , but breaks sbcl --help, etc.
        sbcl --script $*
    fi
}
