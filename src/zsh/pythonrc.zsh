#!/bin/zsh

# pylint
export PYLINTRC="${DOTFILES}/python/pylintrc"
export PYLINTHOME="${DOTFILES}/python/pylint.d"


# pyenv
[ -d ~/opt/pyenv ] && export PYENV_ROOT=~/opt/pyenv
[ -d ~/opt/pyenv/bin ] && PATH=$PATH:~/opt/pyenv/bin
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# poetry
[ -d ~/opt/poetry/bin ] && PATH=$PATH:~/opt/poetry/bin
