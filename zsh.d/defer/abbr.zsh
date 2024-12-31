#!/bin/env zsh

# エイリアス設定
abbr ls='ls -vFG'
abbr ll='ls -ltrh'
abbr la='ls -a'

abbr h='history 20'

abbr more='less'
abbr rm='rm -i'
abbr rehash='hash -r'
abbr s=source
abbr x=start
abbr j=jobs

abbr reload="source ~/.zshrc"

# sleep
#abbr zzz='osascript -e "tell application \"Finder\" to sleep"'

# git
abbr g='git'
abbr gcd='cd $(ghq list -p | fzf)'

# python
abbr lab="\jupyter-lab"

# pip
abbr pipout="uv pip list --outdated"
abbr pipup="uv pip list --outdated --format=columns |awk '{if(NR>2)print \$1}' |xargs pip3 install"
abbr pipin="uv pip install -U"

# brew
abbr brewout="brew update; brew outdated; brew outdated --cask;"
abbr brewup="brew upgrade"

# グローバルエイリアス
abbr -g V="| /usr/share/vim/vim90/macros/less.sh"

# 自分に依存した設定
abbr sakuradiary="~/Sites/sakitojp/bin/scp_diary.sh"

