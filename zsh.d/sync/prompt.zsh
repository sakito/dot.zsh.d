#!/bin/env zsh

# プロンプト設定

# tmux を利用している時にプロンプトに window 番号を設定
if [ "$TMUX" != "" ] ; then
    # export WINDOW=`tmux display -pt $TMUX_PANE '#S:#I.#P'`
    export WINDOW=`tmux display -pt $TMUX_PANE '#I.#P'`
fi

# カラー記述を簡略化
# 数字や文字で色を指定できるようにする
# 0:black
# 1:red
# 2:green
# 3:yellow
# 4:blue
# 5:magenta
# 6:cyan
# 7:white
# それ以外：black
# %f:reset_color
#autoload -Uz colors; colors
# 左プロンプト
PROMPT="%F{green}%n@%m%F{magenta}${WINDOW:+[$WINDOW]}%F{white}%#%f "

# 右プロンプト
# バージョン管理システム関連の情報を表示(zsh >=4.3.6)
autoload -Uz is-at-least
if is-at-least 4.3.6; then
    autoload -Uz vcs_info
    zstyle ':vcs_info:*' enable bzr git svn hg
    if [[ "$TERM" == dumb ]] ; then
        # emacs 等から接続すると dumb 端末と認識され、そうした端末では色を出さないようにする
        zstyle ':vcs_info:*' actionformats "(%s%)-[%b|%a] " "zsh: %r"
        zstyle ':vcs_info:*' formats "(%s%)-[%b] " "zsh: %r"
    else
        # 色をつける
        zstyle ':vcs_info:*' actionformats '%F{magenta}(%f%s%F{magenta})%F{yellow}-%F{magenta}[%F{green}%b%F{yellow}|%F{red}%a%F{magenta}]%f '
        zstyle ':vcs_info:*' formats '%F{magenta}(%f%s%F{magenta})%F{yellow}-%F{magenta}[%F{green}%b%F{magenta}]%f '
        zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{red}:%F{yellow}%r'
        zstyle ':vcs_info:bzr:*' use-simple true
        if is-at-least 4.3.10; then
            zstyle ':vcs_info:*' check-for-changes true
            zstyle ':vcs_info:*' stagedstr "+"
            zstyle ':vcs_info:*' unstagedstr "-"
        fi
    fi
fi

function precmd() {
    local color
    if [[ ${PWD}/ == /Volumes/* ]]; then
        color=%F{yellow}%f
    else
        color=%F{white}%f
    fi

    psvar=()
    vcs_info

    if [ "$EMACS" ];then
        # Emacs の ansi-term では右プロンプトを表示しない
        RPROMPT=""
    else
        # setopt prompt_subst を設定するとプロンプトに変数そのまま記述できる
        # %39<...<%- は 39文字以上になったら前方を ... に置換する設定
        #RPROMPT='[%F{green}%39<...<%~%f] ${vcs_info_msg_0_}%f'
        if [[ ${PWD}/ == /Volumes/* ]]; then
            # Volumes 以下にいる場合
            RPROMPT='[%F{yellow}%K{red}%39<...<%~%k%f] ${vcs_info_msg_0_}'
        else
            # Volumes 以下にいない場合
            RPROMPT='[%F{white}%39<...<%~%f] ${vcs_info_msg_0_}'
        fi
    fi

}

# end
