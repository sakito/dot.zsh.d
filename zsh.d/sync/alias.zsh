#!/bin/env zsh

# エイリアス設定
alias ls='ls -vFG'
alias ll='ls -ltrh'
alias la='ls -a'
alias h='history 20'
alias more='less'
alias rm='rm -i'
#alias which='type -path'
alias rehash='hash -r'
#alias rmdir='rm -rf'
alias s=source
alias x=start
alias j=jobs
alias reload="source ~/.zshrc"

#alias zzz='pmset sleepnow'
alias zzz='osascript -e "tell application \"Finder\" to sleep"'

# git
alias g='git'

# python
#alias hgpush="hg push --new-branch"
#alias ipython="ipython -i -c '%doctest_mode' --pylab "
alias lab="\jupyter-lab"

alias pipin="pip3 install -U"
alias pipup="pip3 list --outdated --format=columns |awk '{if(NR>2)print \$1}' |xargs pip3 install"
alias pipout="pip3 list --outdated"

# brew
alias brewout="brew update; brew outdated"
alias brewin="brew upgrade"

# http://d.hatena.ne.jp/mollifier/20101227/p1
#autoload -Uz zmv
#alias zmv='noglob zmv -W'

# グローバルエイリアス
alias -g V="| /usr/share/vim/vim74/macros/less.sh"

# 自分に依存した設定
alias sakuradiary="~/Sites/sakitojp/bin/scp_diary.sh"
#alias site_sync="~/Sites/sakitojp/bin/site_sync.sh"
