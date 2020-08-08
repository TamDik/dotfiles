#!/bin/zsh

# pylint
export PYLINTRC="${DOTFILES}/python/pylintrc"
export PYLINTHOME="${DOTFILES}/python/pylint.d"


# anaconda
CONDA_DIR=~/opt/anaconda3
CONDARC=$CONDA_DIR/.condarc
PYTHON_DIR=${DOTFILES}/python
export JUPYTER_CONFIG_DIR=$PYTHON_DIR/jupyter
export PYTHONSTARTUP=$PYTHON_DIR/pythonrc.py
export MPLCONFIGDIR=$PYTHON_DIR/matpltlib
export IPYTHONDIR=$PYTHON_DIR/ipython


if [ ! -f $CONDARC ]; then
  cat > $CONDARC << EOF
changeps1: false

EOF
fi


__conda_setup="$(${CONDA_DIR}/bin/conda 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
  eval "$__conda_setup"
else
  if [ -f "${CONDA_DIR}/etc/profile.d/conda.sh" ]; then
    . "${CONDA_DIR}/etc/profile.d/conda.sh"
  else
    export PATH="${CONDA_DIR}/bin:$PATH"
  fi
fi
unset __conda_setup
