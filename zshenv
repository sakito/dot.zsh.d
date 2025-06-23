# -*- mode:sh -*-
# ~/.zshenv
# GUI用の設定

export PATH=/opt/homebrew/bin:${PATH}
export PATH=/opt/homebrew/sbin:${PATH}


ZSHD="${HOME}/.zsh.d"
export TZ=JST-9
export LC_ALL="ja_JP.UTF-8"
export TMP="${HOME}/tmp"
export PREFIX=/usr/local

eval "$(mise activate zsh)"

