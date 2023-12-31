#!/bin/env zsh

# python関連

# pyenv
export PYENV_ROOT=${HOME}/opt/pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"

# Python
export PYTHONSTARTUP="${HOME}/.pythonrc.py"
export VIRTUAL_ENV_DISABLE_PROMPT=true
source ${HOME}/opt/py3.12.1/bin/activate
#export PYTHONPATH=${HOME}/local/lib/python2.7/site-packages
#export WORKON_HOME=${HOME}/.virtualenvs
#source ${HOME}/local/bin/virtualenvwrapper.sh
export PIP_RESPECT_VIRTUALENV=true
if [ -d ${HOME}/python/OpenCV-2.4.2/build/lib ]; then
    export PYTHONPATH=$PYTHONPATH:${HOME}/local/OpenCV-2.4.2/lib
fi

# PATH
export PATH=${HOME}/opt/py2.7/bin:${PATH}
#export PATH=${HOME}/opt/py3.6/bin:${PATH}
export PATH=${HOME}/opt/py3.12.1/bin:${PATH}

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
