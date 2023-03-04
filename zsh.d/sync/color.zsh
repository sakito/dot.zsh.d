#!/bin/env zsh

# -----------------------------------------------------------------
# 色設定
#-----------------------------------------------------------------
# @see http://journal.mycom.co.jp/column/zsh/009/index.html
# Mac OS X ls の色設定
isdarwin && export CLICOLOR=1
# BSD ls 用の色設定
#               1234567890123456789012
export LSCOLORS=GxhFCxdxHbegedabagacad

# coreutils ls および Zsh 補完色用の設定
export LS_COLORS='di=36:ln=37；45:so=32:pi=33:ex=37;41:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'

# end
