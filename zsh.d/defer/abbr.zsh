#!/bin/env zsh
# echo $ABBR_USER_ABBREVIATIONS_FILE

# エイリアス設定

# ls に ezaを利用
abbr -f ls='eza -xG --group-directories-first'
abbr -f ll='eza -xl --group-directories-first'
abbr -f la='eza -xa --group-directories-first'

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

# nvim
abbr -f vi="nvim"
abbr nv="nvim"
abbr -f view="nvim -R"

# グローバルエイリアス
abbr -g V="| /usr/share/vim/vim90/macros/less.sh"

# 自分に依存した設定
abbr diarysync="~/Sites/sakitojp.v2/bin/sync_diary.sh"

