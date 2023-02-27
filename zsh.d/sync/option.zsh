#!/bin/env zsh

# オプション
# デフォルトで設定してある物でも設定してある場合がある

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

# コマンド確定後すぐに履歴ファイルに保存する(設定しないと exit 時保存になる)
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

# 複数端末間で履歴ファイルを共有する(tmuxなど利用する場合は必須)
setopt share_history

# 行末の "` (バッククウォート)" を無視
setopt sun_keyboard_hack

# 変数内の文字列分解のデリミタ
setopt sh_word_split

# コマンド実行後は右プロンプトを消す
setopt transient_rprompt

# end
