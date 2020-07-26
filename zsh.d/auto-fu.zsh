#!/bin/env zsh

# auto-fu
#source ${HOME}/.zsh.d/plugins/auto-fu.zsh/auto-fu.zsh
#function zle-line-init() {auto-fu-init;}; zle -N zle-line-init
# -azfu- の非表示
#zstyle ':auto-fu:var' postdisplay $''

# afu+cancel
#function afu+cancel () {
#    afu-clearing-maybe
#    ((afu_in_p == 1)) && { afu_in_p=0; BUFFER="$buffer_cur"; }
#}
#zle -N afu+cancel
#function bindkey-advice-before () {
#    local key="$1"
#    local advice="$2"
#    local widget="$3"
#    [[ -z "$widget" ]] && {
#        local -a bind
#        bind=(`bindkey -M main "$key"`)
#        widget=$bind[2]
#    }
#    local fun="$advice"
#    if [[ "$widget" != "undefined-key" ]]; then
#        local code=${"$(<=(cat <<"EOT"
#            function $advice-$widget () {
#                zle $advice
#                zle $widget
#            }
#            fun="$advice-$widget"
#EOT
#        ))"}
#        eval "${${${code//\$widget/$widget}//\$key/$key}//\$advice/$advice}"
#    fi
#    zle -N "$fun"
#    bindkey -M afu "$key" "$fun"
#}
#bindkey-advice-before "^G" afu+cancel

# delete unambiguous prefix when accepting line
#function afu+delete-unambiguous-prefix () {
#    afu-clearing-maybe
#    local buf; buf="$BUFFER"
#    local bufc; bufc="$buffer_cur"
#    [[ -z "$cursor_new" ]] && cursor_new=-1
#    [[ "$buf[$cursor_new]" == ' ' ]] && return
#    [[ "$buf[$cursor_new]" == '/' ]] && return
#    ((afu_in_p == 1)) && [[ "$buf" != "$bufc" ]] && {
#        # there are more than one completion candidates
#        zle afu+complete-word
#        [[ "$buf" == "$BUFFER" ]] && {
#            # the completion suffix was an unambiguous prefix
#            afu_in_p=0; buf="$bufc"
#        }
#        BUFFER="$buf"
#        buffer_cur="$bufc"
#    }
#}
#zle -N afu+delete-unambiguous-prefix
#function afu-ad-delete-unambiguous-prefix () {
#    local afufun="$1"
#    local code; code=$functions[$afufun]
#    eval "function $afufun () { zle afu+delete-unambiguous-prefix; $code }"
#}
#afu-ad-delete-unambiguous-prefix afu+accept-line
#afu-ad-delete-unambiguous-prefix afu+accept-line-and-down-history
#afu-ad-delete-unambiguous-prefix afu+accept-and-hold
