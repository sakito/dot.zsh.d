#!/bin/env zsh

export PATH="$PATH:$HOME/opt/node/bin"

NPM_PACKAGES="${HOME}/opt/node/lib/node_modules"
export PATH="$PATH:$NPM_PACKAGES/bin"
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

#NODE_PATH=`npm root -g`
#export NODE_PATH

# end
