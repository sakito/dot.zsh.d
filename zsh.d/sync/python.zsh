#!/bin/env zsh

# python関連

# Python
version=3.13.4
py3_version=py${version}

# setting
export PYTHONSTARTUP="${HOME}/.pythonrc.py"
export VIRTUAL_ENV_DISABLE_PROMPT=true

# uv
source $HOME/.local/bin/env
#export PYENV_ROOT=${HOME}/opt/py
#source ${PYENV_ROOT}/${py3_version}/bin/activate
#export DYLD_FALLBACK_LIBRARY_PATH=~/.local/share/uv/python/cpython-${version}-macos-aarch64-none/lib

#export PYTHONPATH=${HOME}/local/lib/python2.7/site-packages
#export WORKON_HOME=${HOME}/.virtualenvs
#source ${HOME}/local/bin/virtualenvwrapper.sh
#export PIP_RESPECT_VIRTUALENV=true
#if [ -d ${HOME}/python/OpenCV-2.4.2/build/lib ]; then
#    export PYTHONPATH=$PYTHONPATH:${HOME}/local/OpenCV-2.4.2/lib
#fi

# PATH
#export PATH=${HOME}/opt/py/py2.7/bin:${PATH}
#export PATH=${HOME}/opt/py/${py3_version}/bin:${PATH}

# 関数
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

# end
