#!/bin/env zsh

# hg flow 用(暫定)
# TODO 実質決め打ちでエラー処理等はしてない。また使い易いかも現在は考慮してない
function hgflow() {
    local MSG= FLAG_S= FLAG_B= ARGS=
    while getopts :m:sfnrh opt
    do
        case ${opt} in
        m) MSG=${OPTARG};;
        s) FLAG_S="start";;
        f) FLAG_S="finish";;
        n) FLAG_B="feature";;
        r) FLAG_B="release";;
        h) FLAG_B="hotfix";;
        \?) echo "$0 不正なオプション -$OPTARG" >&2;;
        esac
    done
    if [ -z "${MSG}" ] || [ -z "${FLAG_S}" ]  || [ -z "${FLAG_B}" ]; then
        echo "usage: $0 [-m msg] [-sf] [-nrh]"
        # hgflow -s -n -m"test" t3
    else
        shift $((OPTIND -1))
        ARGS=${*}
        echo "「hg flow ${FLAG_B} ${FLAG_S} ${ARGS} -m \"${MSG}\"」yes or no? "
        read yes_no
        if [ ${yes_no} = "yes" ]; then
            command hg flow ${FLAG_B} ${FLAG_S} ${ARGS} -m "${MSG}"
        else
            echo "cancel"
        fi
    fi
}

function hgfopen() {
    # hgfopen 3
    hgflow -s -n -m "refs #$*" t${*}
}

function hgfclose() {
    # hgfclose 3
    hgflow -f -n -m "close #$*" t${*}
}

function hgfrelease() {
    # hgfrelease 3
    hgflow -s -r -m "release $*" "$*"
    hgflow -f -r -m "release $*" "$*"
    command hg flow develop
}

function hgfreo() {
    # hgfreo v1.0
    hgflow -s -r -m "release $*" "$*"
}

function hgfrec() {
    # hgfrec v1.0
    hgflow -f -r -m "release $*" "$*"
    command hg flow develop
}
