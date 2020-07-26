#!/bin/env zsh

# zaw
#source ${HOME}/.zsh.d/plugins/zaw/zaw.zsh
#source ${HOME}/.zsh.d/plugins/cdd/cdd.zsh
#function chpwd() {_reg_pwd_screennum;}
#(( $+functions[cdd] )) || return
#
#function zaw-src-cdd () {
#    if [ -r "$CDD_PWD_FILE" ]; then
#        for window in `cat $CDD_PWD_FILE | sed '/^$/d'`; do
#            candidates+=("${window}")
#        done
#        actions=(zaw-src-cdd-cd)
#        act_descriptions=("cdd for zaw")
#    fi
#}

#function zaw-src-cdd-cd () {
#    BUFFER="cd `echo $1 | cut -d ':' -f 2`"
#    zle accept-line
#}
#zaw-register-src -n cdd zaw-src-cdd

#zmodload zsh/parameter

#function zaw-src-dirstack() {
#    : ${(A)candidates::=$dirstack}
#    actions=("zaw-callback-execute" "zaw-callback-replace-buffer" "zaw-callback-append-to-buffer")
#    act_descriptions=("execute" "replace edit buffer" "append to edit buffer")
#}
#zaw-register-src -n dirstack zaw-src-dirstack

#bindkey '^@' zaw-cdr
#bindkey '^u' zaw-cdd
