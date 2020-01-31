#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
DEFAULT_DOTFILES=~/dotfiles
if [ -n "${DOTFILES}" ] && [ ${DOTFILES} != ${DEFAULT_DOTFILES} ]; then
  tempfile="$(mktemp)"
  sed -E 's|export DOTFILES=[^ ]*|export DOTFILES='${DOTFILES}'|' ${SCRIPT_DIR}/zshenv > $tempfile
  cat $tempfile > ${SCRIPT_DIR}/zshenv
  rm $tempfile
else
  export DOTFILES=$DEFAULT_DOTFILES
fi

ZSH_DIR=${DOTFILES}/zsh
TMUX_DIR=${DOTFILES}/tmux
PYTHON_DIR=${DOTFILES}/python
VIM_DIR=${DOTFILES}/vim
GIT_DIR=${DOTFILES}/git
mkdir -p ${ZSH_DIR}
mkdir -p ${TMUX_DIR}
mkdir -p ${PYTHON_DIR}
mkdir -p ${DEIN_DIR}
mkdir -p ${GIT_DIR}

echo '[ links ]'
ln -snfv ${SCRIPT_DIR}/vimrc             ~/.vimrc
ln -snfv ${SCRIPT_DIR}/zshenv            ~/.zshenv
ln -snfv ${SCRIPT_DIR}/gvimrc            ~/.gvimrc
ln -snfv ${SCRIPT_DIR}/zprofile          ${ZSH_DIR}/.zprofile
ln -snfv ${SCRIPT_DIR}/zshrc             ${ZSH_DIR}/.zshrc
ln -snfv ${SCRIPT_DIR}/tmux.conf         ${TMUX_DIR}/tmux.conf
ln -snfv ${SCRIPT_DIR}/tpm_install       ${TMUX_DIR}/tpm_install
ln -snfv ${SCRIPT_DIR}/battery           ${TMUX_DIR}/battery
ln -snfv ${SCRIPT_DIR}/aliasrc.zsh       ${ZSH_DIR}/aliasrc.zsh
ln -snfv ${SCRIPT_DIR}/fzfrc.zsh         ${ZSH_DIR}/fzfrc.zsh
ln -snfv ${SCRIPT_DIR}/anacondarc.zsh    ${PYTHON_DIR}/anacondarc.zsh
ln -snfv ${SCRIPT_DIR}/pythonrc.py       ${PYTHON_DIR}/pythonrc.py
ln -snfv ${SCRIPT_DIR}/deinrc.vim        ${VIM_DIR}/deinrc.vim
ln -snfv ${SCRIPT_DIR}/mappingrc.vim     ${VIM_DIR}/mappingrc.vim
ln -snfv ${SCRIPT_DIR}/dein.toml         ${VIM_DIR}/dein.toml
ln -snfv ${SCRIPT_DIR}/dein_lazy.toml    ${VIM_DIR}/dein_lazy.toml
ln -snfv ${SCRIPT_DIR}/ignore_global     ${GIT_DIR}/ignore_global
ln -snfv ${SCRIPT_DIR}/commit_template   ${GIT_DIR}/commit_template

cat << EOF

[ requirements ]
You need to install the powerline patched fonts to properly display the prompt.
See 'https://github.com/ryanoasis/nerd-fonts/blob/master/readme.md#font-installation' to install NERD FONTS. 
EOF
