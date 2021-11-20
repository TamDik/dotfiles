#!/bin/sh
# See build prerequisites (https://github.com/neovim/neovim/wiki/Building-Neovim#build-prerequisites)

nvim_user=~/repos/github.com/neovim
nvim_repo=$nvim_user/neovim

if [[ ! -d $nvim_user ]]; then
  mkdir -p $nvim_user
  echo "mkdir -p ${nvim_user}"
fi
cd $nvim_user
if [[ ! -d $nvim_user/neovim ]]; then
  git clone https://github.com/neovim/neovim.git
  echo 'git clone'
else
  git pull
  echo 'git pull'
fi
cd $nvim_repo

make CMAKE_BUILD_TYPE=RelWithDebInfo
make -j$(nproc)
make CMAKE_INSTALL_PREFIX=~/opt/nvim/ install
[[ ! -d ~/bin ]] && mkdir ~/bin
ln -snfv ~/opt/nvim/bin/nvim ~/bin/nvim
