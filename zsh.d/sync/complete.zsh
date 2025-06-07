#!/bin/env zsh

#-----------------------------------------------------------------
# 補完設定
#-----------------------------------------------------------------
# 補完無視ファイル設定
fignore=(.o .dvi .aux .toc - \~)

# ロード
# rm -f ~/.zcompdump; compinit
#fpath=(${HOME}/.emacs.d/rc.d/zsh.d/completions/src $fpath)
fpath=(/usr/local/share/zsh-completions $fpath)
fpath=(/usr/local/etc/bash_completion.d $fpath)
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
# 補完の利用設定
#autoload -Uz compinit; compinit

## キャッシュの設定
# 補完をキャッシュ
zstyle ':completion:*' use-cache true
# 補完時一部のblobを省略して高速化
zstyle ':completion:*' accept-exact '*(N)'
# キャッシュファイル位置
zstyle ':completion:*' cache-path ~/var/zsh/zsh_completion.cache

## 補完設定
# 補完をデバッグする場合は ^xh
# 補完表示を全てする
zstyle ':completion:*' verbose true
# 補完の機能を拡張
#zstyle ':completion:*' completer _expand _oldlist _complete _match _prefix _approximate _list _history
#zstyle ':completion:*' completer _oldlist _complete _expand _match _prefix _approximate _list _history
zstyle ':completion:*' completer _complete _match _prefix _approximate _list _history
# 補完候補で入力された文字でまず補完してみて、補完不可なら大文字小文字を変換して補完する
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z} r:|[-_.]=**' '+m:{A-Z}={a-z} r:|[-_.]=**'

## 色設定
# 補完候補に LSCOLORS 同様色を付与
#zstyle ':completion:*:default' list-colors ${(s.:.)LSCOLORS}
# ファイルリスト補完でも coreutils ls と同様に色をつける
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# 補完メッセージの色
zstyle ':completion:*:messages' format "%F{yellow}%'%d'%f"
zstyle ':completion:*:warnings' format "%F{red}'No matches for:%f'%F{yellow}' %d'%f"
zstyle ':completion:*:descriptions' format "%F{yellow}'completing %B%d%b'%f"
zstyle ':completion:*:corrections' format "%F{yellow}'%B%d '%f%F{red}'(errors: %e)%b'%f"

# 補完説明を表示する
zstyle ':completion:*:options' description true
# sudo でも補完の対象とする
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
# kill 補完で実行されるコマンドを指定
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
# SCP での補完を抑止
zstyle ':completion:*:complete:scp:*:files' command command -
zstyle ':completion:*:files' remote-access no

# end
