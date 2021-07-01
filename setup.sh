#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)/src
DEFAULT_DOTFILES=~/dotfiles
if [ -n "${DOTFILES}" ] && [ ${DOTFILES} != ${DEFAULT_DOTFILES} ]; then
  tempfile="$(mktemp)"
  sed -E 's|export DOTFILES=[^ ]*|export DOTFILES='${DOTFILES}'|' ${SCRIPT_DIR}/zsh/zshenv > $tempfile
  cat $tempfile > ${SCRIPT_DIR}/zsh/zshenv
  rm $tempfile
else
  export DOTFILES=$DEFAULT_DOTFILES
fi

ZSH_DIR=${DOTFILES}/zsh
TMUX_DIR=${DOTFILES}/tmux
PYTHON_DIR=${DOTFILES}/python
VIM_DIR=${DOTFILES}/vim
NVIM_DIR=${DOTFILES}/nvim
GIT_DIR=${DOTFILES}/git
mkdir -p ~/repos
mkdir -p ${ZSH_DIR}
mkdir -p ${TMUX_DIR}
mkdir -p ${PYTHON_DIR}
mkdir -p ${VIM_DIR}
mkdir -p ${NVIM_DIR}
mkdir -p ${GIT_DIR}
mkdir -p ~/.config/nvim
mkdir -p ~/.config/tmux
mkdir -p ~/.config/alacritty

echo '[ links ]'
ln -snfv ${SCRIPT_DIR}/alacritty.yml           ~/.config/alacritty/alacritty.yml
ln -snfv ${SCRIPT_DIR}/git/gitconfig           ~/.gitconfig
ln -snfv ${SCRIPT_DIR}/git/commit_template     ${GIT_DIR}/commit_template
ln -snfv ${SCRIPT_DIR}/git/ignore_global       ${GIT_DIR}/ignore_global
ln -snfv ${SCRIPT_DIR}/pylintrc                ${PYTHON_DIR}/pylintrc
ln -snfv ${SCRIPT_DIR}/pythonrc.py             ${PYTHON_DIR}/pythonrc.py
ln -snfv ${SCRIPT_DIR}/tmux/battery            ${TMUX_DIR}/battery
ln -snfv ${SCRIPT_DIR}/tmux/tmux.conf          ~/.config/tmux/tmux.conf
ln -snfv ${SCRIPT_DIR}/tmux/tpm_install        ${TMUX_DIR}/tpm_install
ln -snfv ${SCRIPT_DIR}/vim/colorrc.vim         ${VIM_DIR}/colorrc.vim
ln -snfv ${SCRIPT_DIR}/vim/dein.toml           ${VIM_DIR}/dein.toml
ln -snfv ${SCRIPT_DIR}/vim/dein_lazy.toml      ${VIM_DIR}/dein_lazy.toml
ln -snfv ${SCRIPT_DIR}/vim/deinrc.vim          ${VIM_DIR}/deinrc.vim
ln -snfv ${SCRIPT_DIR}/vim/gvimrc              ~/.gvimrc
ln -snfv ${SCRIPT_DIR}/vim/init.vim            ~/.config/nvim/init.vim
ln -snfv ${SCRIPT_DIR}/vim/neovimrc.vim        ${NVIM_DIR}/neovimrc.vim
ln -snfv ${SCRIPT_DIR}/vim/mappingrc.vim       ${VIM_DIR}/mappingrc.vim
ln -snfv ${SCRIPT_DIR}/vim/optionrc.vim        ${VIM_DIR}/optionrc.vim
ln -snfv ${SCRIPT_DIR}/vim/vimrc               ~/.vimrc
ln -snfv ${SCRIPT_DIR}/zsh/aliasrc.zsh         ${ZSH_DIR}/aliasrc.zsh
ln -snfv ${SCRIPT_DIR}/zsh/fzfrc.zsh           ${ZSH_DIR}/fzfrc.zsh
ln -snfv ${SCRIPT_DIR}/zsh/pythonrc.zsh        ${PYTHON_DIR}/pythonrc.zsh
ln -snfv ${SCRIPT_DIR}/zsh/zprofile            ${ZSH_DIR}/.zprofile
ln -snfv ${SCRIPT_DIR}/zsh/zshenv              ~/.zshenv
ln -snfv ${SCRIPT_DIR}/zsh/zshrc               ${ZSH_DIR}/.zshrc


GIT_USER_CONFIG=${GIT_DIR}/user_config
if [ ! -f $GIT_USER_CONFIG ]; then
  echo '[ gitconfig ]'
  echo -n "git config user.name > "
  read user_name
  echo -n "git config user.email > "
  read user_email
  cat > $GIT_USER_CONFIG << EOF
[user]
	name = $user_name
	email = $user_email
EOF
fi


echo '[ Requirements ]'
if [ $SHELL != $(which zsh) ]; then
  echo '* You need to change shell to zsh. Run `chsh -s $(which zsh)`.'
fi
if type curl > /dev/null 2>&1; then
  :
else
  echo '* You need to install curl.'
fi
if type nvim > /dev/null 2>&1; then
  :
else
  echo '* The default editor is neovim but nvim command was not found.'
  echo "  See 'https://github.com/neovim/neovim' or 'https://github.com/neovim/neovim/releases/' to install neovim."
fi
cat << EOF
* You need to install the powerline patched fonts to properly display the prompt.
  See 'https://github.com/ryanoasis/nerd-fonts/blob/master/readme.md#font-installation' to install NERD FONTS. 
EOF
