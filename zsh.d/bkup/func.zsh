#!/bin/env zsh

# @see http://d.hatena.ne.jp/jeneshicc/20110215/1297778049
# このGnu tar には解凍時、圧縮形式を自動判定する機能があるので、
# この関数はほぼ不要だが、サンプルとして入れている
function ex () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2) tar xvfj $1 ;;
            *.tar.gz) tar xvfz $1 ;;
            *.tar.xz) tar xvfJ $1 ;;
            *.bz2) bunzip2 $1 ;;
            *.rar) unrar x $1 ;;
            *.gz) gunzip $1 ;;
            *.tar) tar xvf $1 ;;
            *.tbz2) tar xvfj $1 ;;
            *.tgz) tar xvfz $1 ;;
            *.zip) unzip $1 ;;
            *.Z) uncompress $1 ;;
            *.7z) 7z x $1 ;;
            *.lzma) lzma -dv $1 ;;
            *.xz) xz -dv $1 ;;
            *) echo "don't know how to extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}
