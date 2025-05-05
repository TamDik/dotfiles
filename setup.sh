#!/usr/bin/env bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)/src

for config in $SCRIPT_DIR/config/**/*; do
  dest_config=~/.config/${config#$SCRIPT_DIR/config/}
  mkdir -p $(dirname $dest_config)
  ln -snfv $config $dest_config
done

ln -snfv ${SCRIPT_DIR}/vim/vimrc ~/.vimrc
ln -snfv ${SCRIPT_DIR}/zsh/zshrc ~/.zshrc
ln -snfv ${SCRIPT_DIR}/zsh/zprofile ~/.zprofile
