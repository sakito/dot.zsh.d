#!/bin/env zsh

# node.js 設定

export PATH=${HOME}/.nodebrew/current/bin:${PATH}

# npm設定
NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

# end
