#!/bin/env zsh

# node.js 設定

export PATH=${HOME}/.nodebrew/current/bin:${PATH}

# npm設定
export NPM_CONFIG_PREFIX="${HOME}/.npm-packages"
export PATH="$PATH:$NPM_CONFIG_PREFIX/bin"
export MANPATH="${MANPATH-$(manpath)}:$NPM_CONFIG_PREFIX/share/man"

# nodeの設定
NODE_PATH=`npm root -g`
export NODE_PATH

# end
