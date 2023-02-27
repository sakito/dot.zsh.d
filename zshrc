# -*- mode:sh -*-
# ~/.zshrc
# 作成開始: [2002/10/01]
# 改訂: [2011/07/17]
# 改訂: [2023/02/27]
#
#-----------------------------------------------------------------
# 基本設定
#-----------------------------------------------------------------
WORDCHARS="*?_-.[]~=&;\!#$%^(){}<>"
HISTSIZE=4096
HISTFILE=${HOME}/var/zsh/zsh_history
SAVEHIST=4096
umask 022

# 設定ファイル分割関連
ZSHD="${HOME}/.zsh.d"

# sheldon
eval "$(sheldon source)"

#-----------------------------------------------------------------
# 判定用関数
#-----------------------------------------------------------------
# Mac OS X特有の設定を切り分るための関数
isdarwin() {
    [[ $OSTYPE == darwin* ]] && return 0
    return 1
}

# Emacs の term で動作させた場合
isemacs() {
    [[ "$EMACS" != "" ]] && return 0
    return 1
}

#-----------------------------------------------------------------
# 環境変数
#-----------------------------------------------------------------
#SHELL=/bin/zsh
isdarwin && export SHELL=/usr/local/bin/zsh

export PREFIX=/usr/local
#export EXEC_PREFIX=/usr/local/bin

# 時刻の設定
export TZ=JST-9

# 文字コード設定
export LC_ALL="ja_JP.UTF-8"

# DISPLAY
export DISPLAY="localhost"

# 一時ファイル
export TMP="${HOME}/tmp"

# EDITOR
export EDITOR="/usr/local/bin/emacsclient"

# パスとコマンド固有の設定
export PATH=/opt/homebrew/bin:${PATH}
export PATH=/usr/local/sbin:${PATH}
export PATH=/usr/local/bin:${PATH}

# mysql
export PATH=/usr/local/mysql/bin:${PATH}
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib

# LaTeX
export PATH=/usr/texbin:${PATH}
export TEXINPUTS=${HOME}/lib/tex/:${TEXINPUTS}

# Haskell
export PATH=${PATH}:${HOME}/.cabal/bin

# node
export PATH=${PATH}:${HOME}/local/node/bin

# Homebrew
#export HOMEBREW_GITHUB_API_TOKEN=$(security find-generic-password -a homebrew-github-api-token -s homebrew-github-api-token -w)
export PATH=/usr/local/opt/libxml2/bin:${PATH}
export PATH=/usr/local/opt/texinfo/bin:${PATH}
export PATH=/usr/local/opt/openssl/bin:${PATH}
export PATH=/usr/local/opt/libiconv/bin:${PATH}


export LDFLAGS=-L/usr/local/opt/readline/lib:/usr/local/opt/openssl/lib:${LDFLAGS}:/usr/local/opt/libxml2/lib:/usr/local/opt/libiconv/lib
export CPPFLAGS=-I/usr/local/opt/readline/include:/usr/local/opt/oepnssl/include:${CPPFLAGS}:/usr/local/opt/libxml2/include:/usr/local/opt/libiconv/include

export PKG_CONFIG_PATH="/usr/local/opt/libxml2/lib/pkgconfig:/usr/local/opt/openssl/lib/pkgconfig"

# Java
export JAVA_OPTS="-Dfile.encoding=UTF-8"

# CLASSPATH
# export CLASSPATH=${CLASSPATH}:.
if [ -r ${HOME}/lib/java/classpath ]; then
  if [ -z "$CLASSPATH" ]; then
    export CLASSPATH=`cat ${HOME}/lib/java/classpath`
  else
    export CLASSPATH=`cat ${HOME}/lib/java/classpath`:$CLASSPATH
  fi
fi

# less
#export LESSCHARDEF=8bcccbcc18b95.33b33b.
export LESSCHARSET=utf-8
export LESS='-e -F -R -S -X -x4'
#export LESS='-c -m -x4 -R -F -X'
#export LESS="-isnMCd"

export LESSBINFMT='*n-'
export PAGER=less
export CLICOLOR_FORCE=1

#CC setting
export CC=clang

# set man command env.
export MANPATH=/usr/bin/man:/usr/local/man:/usr/share/man:/Developer/usr/share/man:/opt/local/man
export MANPAGER=/usr/bin/less
export MANWIDTH=80

# for Mercurial
export HGENCODING=utf-8

# 最優先パス
export PATH=${HOME}/.emacs.d/bin:${PATH}
export PATH=${HOME}/bin:${PATH}
export PATH=${HOME}/opt/py39/bin:${PATH}
#export PATH=${HOME}/opt/py36/bin:${PATH}
export PATH=${HOME}/opt/py27/bin:${PATH}

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

# URLをコピペした時にエスケープ対象文字を自動エスケープする
#autoload -Uz url-quote-magic
#zstyle ':url-quote-magic:*' url-metas '?'
#zle -N self-insert url-quote-magic


# cdr 設定
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 5000
zstyle ':chpwd:*' recent-dirs-default true
zstyle ':completion:*' recent-dirs-insert both

#-----------------------------------------------------------------
# ローカル設定の読み込み
#-----------------------------------------------------------------
[ -f ${ZSHD}/zshrc.local ] && source ${ZSHD}/zshrc.local

#if (which zprof > /dev/null 2>&1) ;then
#  zprof
#fi

echo Now zsh version $ZSH_VERSION start!

# end of ~/.zshrc
#=================================================================
