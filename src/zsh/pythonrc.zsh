#!/bin/zsh

# pylint
export PYLINTRC="${DOTFILES}/python/pylintrc"
export PYLINTHOME="${DOTFILES}/python/pylint.d"


# pyenv
[ -d ~/opt/pyenv ] && export PYENV_ROOT=~/opt/pyenv
[ -d ~/opt/pyenv/bin ] && PATH=$PATH:~/opt/pyenv/bin
eval "$(pyenv init -)"

# poetry
[ -d ~/opt/pypoetry/bin ] && PATH=$PATH:~/opt/pypoetry/bin
