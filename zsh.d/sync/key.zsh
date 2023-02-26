#!/bin/env zsh

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

# end
