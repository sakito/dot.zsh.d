# -*- mode:sh -*-
# ~/.zshrc
# 作成開始: [2002/10/01]
# 大規模改訂: [2011/07/17]
#
#-----------------------------------------------------------------
# 基本設定
#-----------------------------------------------------------------
WORDCHARS="*?_-.[]~=&;\!#$%^(){}<>"
HISTSIZE=4096
HISTFILE=${HOME}/var/zsh/zsh_history
SAVEHIST=4096
umask 022

#-----------------------------------------------------------------
# 判定用関数
#-----------------------------------------------------------------
# Mac OS X特有の設定を切り分るための関数
isdarwin(){
    [[ $OSTYPE == darwin* ]] && return 0
    return 1
}

# Emacs の term で動作させた場合
isemacs(){
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

# CVS
export CVSROOT=${HOME}/var/cvs
export CVS_RSH="ssh"

# パスとコマンド固有の設定
# Mac OS X の初期パスは /usr/bin:/bin:/usr/sbin:/sbin:/usr/X11R6/bin:

export PATH=/usr/local/sbin:${PATH}
export PATH=/usr/local/bin:${PATH}

# MacPorts
isdarwin && export PATH=/opt/local/bin:${PATH}

# Python
#export PATH=/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}
export PYTHONSTARTUP="${HOME}/.pythonrc.py"
export VIRTUAL_ENV_DISABLE_PROMPT=true
source ${HOME}/opt/py36/bin/activate
#export PYTHONPATH=${HOME}/local/lib/python2.7/site-packages
export WORKON_HOME=${HOME}/.virtualenvs
#source ${HOME}/local/bin/virtualenvwrapper.sh
export PIP_RESPECT_VIRTUALENV=true
if [ -d ${HOME}/python/OpenCV-2.4.2/build/lib ];then
    export PYTHONPATH=$PYTHONPATH:${HOME}/local/OpenCV-2.4.2/lib
fi

# pyenv
export PYENV_ROOT=/opt/pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"


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
export HOMEBREW_GITHUB_API_TOKEN=$(security find-generic-password -a homebrew-github-api-token -s homebrew-github-api-token -w)
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

# 64bit
#export ARCHFLAGS='-Os -arch x86_64 -fno-common'

# 最優先パス
export PATH=${HOME}/.emacs.d/bin:${PATH}
export PATH=${HOME}/bin:${PATH}
export PATH=${HOME}/opt/py36/bin:${PATH}
export PATH=${HOME}/opt/py27/bin:$PATH

#-----------------------------------------------------------------
# 非端末プロセスなら終了
#-----------------------------------------------------------------
# スクリプトとして起動された場合、ここでプロセスが終了する。
[ $#PROMPT -eq 0 -o $#TERM -eq 0 ] && return

#-----------------------------------------------------------------
# オプション
#-----------------------------------------------------------------
# 無駄なスクロールを避ける
setopt always_last_prompt
# 履歴ファイルに追加
setopt append_history
# 自動的に候補一覧を表示
setopt auto_list
# 自動的に補完候補を表示する
unsetopt auto_menu
# "~$var" でディレクトリにアクセス
#setopt	auto_name_dirs
# 変数名に対して無駄なスペースの削除やカッコの補完をする
setopt auto_param_keys
# cdのタイミングで自動的にpushd
setopt auto_pushd
# 無駄な末尾の / を削除する
unsetopt auto_remove_slash
# ディレクトリにマッチした場合/を付加
setopt mark_dirs
# csh スタイルのヒストリ置換
setopt bang_hist
# {a-za-z} をブレース展開
setopt brace_ccl
# 先頭に "~" を付けたもので展開
setopt cdable_vars
# 語の途中でもカーソル位置で補完
setopt complete_in_word
# 補完動作の解釈前にエイリアス展開
setopt complete_aliases
# タイプミスの修正
setopt correct
# = で初まる物をコマンドとして展開する 例：ls =ps  デフォルトで有効
# setopt equals
# "#", "~", "^" を正規表現として扱う
setopt extended_glob
# 履歴ファイルに開始/終了タイムスタンプを書き込み
setopt extended_history
# "*" にドットファイルをマッチ
# setopt glob_dots
# ">" を ">!" としてヒストリ保存
setopt hist_allow_clobber
# 以前のコマンドと全く同じ時以前の履歴から削除して新たに追加する
setopt hist_ignore_all_dups
# 直前の履歴と全く同じとき履歴に追加しない
setopt hist_ignore_dups
# 先頭がスペースで始まるときスペースを無視
setopt hist_ignore_space
# 余分なスペースを削除して履歴に保存
setopt hist_reduce_blanks
# 履歴を直接実行せず編集状態にする
# setopt hist_verify
# ctr-d で終了しない
setopt ignore_eof
# コマンド確定後すぐに履歴ファイルに保存する(設定しないと exit 時)
setopt inc_append_history
# 補完候補をコンパクトにする
setopt list_packed
# ファイル種別を表す記号を末尾に表示
setopt list_types
# "val=expr" のような = 以降でファイル名展開
setopt magic_equal_subst
# 一覧表示せずに、すぐに最初の候補を補完
#setopt	menu_complete
# 複数のリダイレクトやパイプに対応
setopt multios
# ファイル名を数値的にソート
setopt numeric_glob_sort
# リダイレクトで上書き禁止
setopt no_clobber
# ベルを鳴らさない
setopt no_beep
# シェル終了時にジョブをチェックしない
#setopt no_check_jobs
# C-s/C-q によるフロー制御をしない
setopt no_flow_control
# 走行中のジョブにシグナルを送らない
setopt no_hup
# 補完の時にベルを鳴らさない
setopt no_list_beep
# ジョブの状態をただちに知らせる
setopt notify
# 補完候補の最初を自動補完しない
unsetopt menu_complete
# プロンプト内で変数展開
setopt prompt_subst
# 8ビットクリーン表示
setopt print_eight_bit
# 重複するディレクトリを無視
setopt pushd_ignore_dups
# "rm * " を実行する前に確認しない
# setopt rm_star_silent
# 複数端末間で履歴ファイルを共有する
setopt share_history
# 行末の "` (バッククウォート)" を無視
setopt sun_keyboard_hack
# 変数内の文字列分解のデリミタ
setopt sh_word_split
# コマンド実行後は右プロンプトを消す
setopt transient_rprompt

#-----------------------------------------------------------------
# プロンプト設定
#-----------------------------------------------------------------
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
autoload -Uz colors; colors
# 左プロンプト
#PROMPT="%{$fg[green]%}%n@%m%{$fg[magenta]%}${WINDOW:+[$WINDOW]}%{$fg[white]%}%#%f "
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
        color=${fg[yellow]}${bg[red]}
    else
        color=${fg[white]}
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
fpath=(${HOME}/.emacs.d/rc.d/zsh.d/completions/src $fpath)
fpath=(/usr/local/share/zsh-completions $fpath)
fpath=(/usr/local/etc/bash_completion.d $fpath)
# 補完の利用設定
autoload -Uz compinit; compinit

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
zstyle ':completion:*:messages' format "%{$fg[yellow]%}'%d'%f"
zstyle ':completion:*:warnings' format "%{$fg[red]%}'No matches for:'%{$fg[yellow]%}' %d'%f"
zstyle ':completion:*:descriptions' format "%{$fg[yellow]%}'completing %B%d%b'%f"
zstyle ':completion:*:corrections' format "%{$fg[yellow]%}'%B%d '%{$fg[red]%}'(errors: %e)%b'%f"

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

autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 5000
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':completion:*' recent-dirs-insert both

#-----------------------------------------------------------------
# plugin
#-----------------------------------------------------------------
#unsetopt auto_remove_slash
unsetopt sh_word_split
# zaw
#source ${HOME}/.emacs.d/rc.d/zsh.d/plugins/zaw/zaw.zsh
#source ${HOME}/.emacs.d/rc.d/zsh.d/plugins/cdd/cdd.zsh
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

# auto-fu
#source ${HOME}/.emacs.d/rc.d/zsh.d/plugins/auto-fu.zsh/auto-fu.zsh
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


#-----------------------------------------------------------------
# 関数定義
#-----------------------------------------------------------------

# 汎用

# @see http://d.hatena.ne.jp/jeneshicc/20110215/1297778049
# このGnu tar には解凍時、圧縮形式を自動判定する機能があるので、
# この関数はほぼ不要だが、サンプルとして入れている
function ex () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2) tar xvfj $1 ;;
            *.tar.gz) tar xvfz $1 ;;
            *.tar.xz) tar xvfJ $1 ;;
            *.bz2) bunzip2 $1 ;;
            *.rar) unrar x $1 ;;
            *.gz) gunzip $1 ;;
            *.tar) tar xvf $1 ;;
            *.tbz2) tar xvfj $1 ;;
            *.tgz) tar xvfz $1 ;;
            *.zip) unzip $1 ;;
            *.Z) uncompress $1 ;;
            *.7z) 7z x $1 ;;
            *.lzma) lzma -dv $1 ;;
            *.xz) xz -dv $1 ;;
            *) echo "don't know how to extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

# Common Lisp 用

# ccl
function ccl() {
    BREAK_CHARS="(){}[],^%$#@\"\";''|\\"
    ccl="rlwrap -pgreen -r -m --history-filename=${HOME}/.ccl/ccl_history --histsize=1000000 -c -b ${BREAK_CHARS} -f ${HOME}/.ccl/ccl_completions ccl64 -K utf-8"
    if [ "$1" = "--script" ]; then
        $ccl --load "$2" --eval '(ccl:quit)'
    else
        $ccl $@
    fi
}

# sbcl
function sbcl() {
    BREAK_CHARS="(){}[],^%$#@\"\";''|\\"
    RLWRAP=""
    if [ $TERM = "dumb" ]; then  # slime
        RLWRAP=""
    else
        RLWRAP="rlwrap -pgreen -r -m --history-filename=${HOME}/.sbcl/sbcl_history --histsize=1000000 -c -b ${BREAK_CHARS} -f ${HOME}/.sbcl/sbcl_completions"
    fi
    if [ $# -eq 0 ]; then
        $RLWRAP sbcl
    else # permits #!/usr/bin/env sbcl , but breaks sbcl --help, etc.
        sbcl --script $*
    fi
}

# Emacs 用

# @see http://masutaka.net/chalow/2011-09-28-1.html
# ディレクトリを Emacs の dired で開く
function dired () {
    emacsclient -e "(dired \"${1:a}\")"
}

# emacs 側に設定が必要です init_elscreen に関数を定義してあります
function cde () {
    EMACS_CWD=`emacsclient -e "
    (if (featurep 'elscreen)
    (elscreen-current-directory)
    (non-elscreen-current-directory))" | sed 's/^"\(.*\)"$/\1/'`

    echo "chdir to $EMACS_CWD"
    cd "$EMACS_CWD"
}

# hg flow 用(暫定)
# TODO 実質決め打ちでエラー処理等はしてない。また使い易いかも現在は考慮してない
function hgflow() {
    local MSG= FLAG_S= FLAG_B= ARGS=
    while getopts :m:sfnrh opt
    do
        case ${opt} in
        m) MSG=${OPTARG};;
        s) FLAG_S="start";;
        f) FLAG_S="finish";;
        n) FLAG_B="feature";;
        r) FLAG_B="release";;
        h) FLAG_B="hotfix";;
        \?) echo "$0 不正なオプション -$OPTARG" >&2;;
        esac
    done
    if [ -z "${MSG}" ] || [ -z "${FLAG_S}" ]  || [ -z "${FLAG_B}" ]; then
        echo "usage: $0 [-m msg] [-sf] [-nrh]"
        # hgflow -s -n -m"test" t3
    else
        shift $((OPTIND -1))
        ARGS=${*}
        echo "「hg flow ${FLAG_B} ${FLAG_S} ${ARGS} -m \"${MSG}\"」yes or no? "
        read yes_no
        if [ ${yes_no} = "yes" ]; then
            command hg flow ${FLAG_B} ${FLAG_S} ${ARGS} -m "${MSG}"
        else
            echo "cancel"
        fi
    fi
}

function hgfopen() {
    # hgfopen 3
    hgflow -s -n -m "refs #$*" t${*}
}

function hgfclose() {
    # hgfclose 3
    hgflow -f -n -m "close #$*" t${*}
}

function hgfrelease() {
    # hgfrelease 3
    hgflow -s -r -m "release $*" "$*"
    hgflow -f -r -m "release $*" "$*"
    command hg flow develop
}

function hgfreo() {
    # hgfreo v1.0
    hgflow -s -r -m "release $*" "$*"
}

function hgfrec() {
    # hgfrec v1.0
    hgflow -f -r -m "release $*" "$*"
    command hg flow develop
}

# python
function pjson {
    if [ $# -gt 0 ];
    then
        for arg in $@
        do
            if [ -f $arg ];
            then
                less $arg | python -m json.tool
            else
                echo "$arg" | python -m json.tool
            fi
        done
    fi
}

# Erlang
function ercrun {
    if [ $# -gt 0 ];
    then
        erl -noshell -s $@ -s init stop
    fi
}

# peco
function peco-select-history() {
    local tac
    if which tac > /dev/null;
    then
        tac="tac"
    elif which gtac > /dev/null;
    then
        tac="gtac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        awk '!a[$0]++' | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
if which peco > /dev/null;
then
    zle -N peco-select-history
    bindkey '^r' peco-select-history
else
    bindkey '^r' zaw-history
fi

function peco-select-port-upgrade() {
    sudo port upgrade $(port outdated | \
    pbcopy; pbpaste | \
    peco | \
    cut -f1 -d' ')
}



#-----------------------------------------------------------------
# エイリアス設定
#-----------------------------------------------------------------
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
autoload -Uz zmv
alias zmv='noglob zmv -W'

# グローバルエイリアス
alias -g V="| /usr/share/vim/vim74/macros/less.sh"

# 自分に依存した設定
alias sakuradiary="~/Sites/sakitojp/bin/scp_diary.sh"
#alias site_sync="~/Sites/sakitojp/bin/site_sync.sh"

#-----------------------------------------------------------------
# キーバインド設定
#-----------------------------------------------------------------
bindkey -e
bindkey '^/' undo
bindkey '^g' undo
bindkey '^q' push-line
bindkey '^w' kill-region
bindkey '^i' expand-or-complete 
bindkey '^d' delete-char-or-list
bindkey '^j' reverse-menu-complete
bindkey '^n' history-search-forward
bindkey '^p' history-search-backward
#bindkey '^r' copy-prev-word
bindkey ' '  magic-space

#bindkey '^@' zaw-cdr
#bindkey '^u' zaw-cdd

#-----------------------------------------------------------------
# システム別設定
#-----------------------------------------------------------------
#if [ ! -S ${SSH_AUTH_SOCK} ]; then
#    eval `ssh-agent -a ${SSH_AUTH_SOCK}`
#    echo ${SSH_AGENT_PID} > /tmp/ssh_agent_pid
#    ssh-add
#else
#    export SSH_AGENT_PID=`cat /tmp/ssh_agent_pid`
#fi

#-----------------------------------------------------------------
# ローカル設定の読み込み
#-----------------------------------------------------------------
# [ -f ~/.zshrc.local ] && source ~/.zshrc.local

echo Now zsh version $ZSH_VERSION start!

# 端末をクリアして終了
# builtin cls
# end of ~/.zshrc
#=================================================================
