#!/usr/bin/env bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)/src

for config in $SCRIPT_DIR/config/**/*; do
  dest_config=~/.config/${config#$SCRIPT_DIR/config/}
  mkdir -p $(dirname $dest_config)
  ln -snfv $config $dest_config
done

ln -snfv ${SCRIPT_DIR}/zsh/zshrc ~/.zshrc
ln -snfv ${SCRIPT_DIR}/zsh/zprofile ~/.zprofile

mkdir -p ~/.claude
ln -snfv ${SCRIPT_DIR}/agent/claude/settings.json ~/.claude/settings.json

mkdir -p ~/.local/bin
for bin in ${SCRIPT_DIR}/bin/*; do
  ln -snfv $bin ~/.local/bin/$(basename $bin)
done

# mise で入れた docker-compose を `docker compose` サブコマンドとして使えるようにする
mkdir -p ~/.docker/cli-plugins
ln -snfv ~/.local/share/mise/installs/docker-compose/latest/docker-compose ~/.docker/cli-plugins/docker-compose
