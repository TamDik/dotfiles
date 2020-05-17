#!/bin/zsh

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

FZF_SHELL_DIR=~/repos/zplug/junegunn/fzf/shell
[ -f $FZF_SHELL_DIR/completion.zsh ] && source $FZF_SHELL_DIR/completion.zsh
[ -f $FZF_SHELL_DIR/key-bindings.zsh ] && source $FZF_SHELL_DIR/key-bindings.zsh
# CTRL-T - Paste the selected files and directories onto the command-line
# CTRL-R - Paste the selected command from history onto the command-line
# ALT-C  - cd into the selected directory


# Open the selected file at ``rcdir'' 
frc() (
  local rcdir rcfile
  rcdir=~/repos/github.com/TamDik/dotfiles
  cd $rcdir > /dev/null
  # rcfile=$(find . -name '.git' -prune -o -type f -print | sed '/README/d' | sed -e 's/^.\///' | fzf)
  rcfile=$(find . -name '.git' -prune -o -type f -print | sed -e 's/^.\///' | fzf)
  if [ -z "$rcfile" ]; then
    return
  fi
  vim "$rcfile"
)

# select a tmux session
fts () {
  tmux list-sessions 2> /dev/null | fzf --exit-0 | awk -F: '{print $1}'
}


# attach the selected session
fta () {
  if [ -n "$TMUX" ]; then
    return
  fi

  message_of_creation='CREATE NEW SESSION'
  sessions=$(tmux list-sessions 2> /dev/null)
  if [ -z "$sessions" ]; then
    sessions=$message_of_creation
  else
    sessions="${message_of_creation}\n${sessions}"
  fi

  session=$(echo $sessions | fzf --exit-0 --select-1 | awk -F: '{print $1}')
  case $session in
    ${message_of_creation} )
      echo -n '\n\e[031mNEW SESSION NAME ❱\e[m '
      read session_name
      if [ -n "$session_name" ]; then
        tmux -f ${DOTFILES}/tmux/tmux.conf new -s $session_name
      fi;;

    '' ) ;;
    * ) tmux attach -t $session;;
  esac
}

# fbr - checkout git branch
fbr() {
  local branches branch
  branches=$(git --no-pager branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

