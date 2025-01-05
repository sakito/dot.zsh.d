#!/bin/env zsh

# Homebrew
#export HOMEBREW_GITHUB_API_TOKEN=$(security find-generic-password -a homebrew-github-api-token -s homebrew-github-api-token -w)
export PATH=/opt/homebrew/opt/libxml2/bin:${PATH}
export PATH=/opt/homebrew/opt/texinfo/bin:${PATH}
export PATH=/opt/homebrew/opt/openssl/bin:${PATH}
export PATH=/opt/homebrew/opt/libiconv/bin:${PATH}

export LDFLAGS="-L/opt/homebrew/opt/readline/lib -L/opt/homebrew/opt/openssl/lib ${LDFLAGS} -L/opt/homebrew/opt/libxml2/lib -L/opt/homebrew/opt/libiconv/lib"
export CPPFLAGS=-I/opt/homebrew/opt/readline/include:/opt/homebrew/opt/oepnssl/include:${CPPFLAGS}:/opt/homebrew/opt/libxml2/include:/opt/homebrew/opt/libiconv/include

export PKG_CONFIG_PATH="/opt/homebrew/opt/libxml2/lib/pkgconfig:/opt/homebrew/opt/openssl/lib/pkgconfig"

# end
