# alias
alias vim='nvim'
alias ctags="`brew --prefix`/bin/ctags"
alias tmux="tmux -f ${DOTFILES}/tmux/tmux.conf"
alias ipython='ipython --pylab'
[ -x ~/opt/anaconda3/bin/python3 ] && alias python='~/opt/anaconda3/bin/python3'
alias ls='ls -GF'
alias la='ls -aGF'
alias ll='ls -lhGF'
alias lla='ls -alhGF'
alias tree='tree -NC -l'

alias gst='git status'
alias gdf='git diff'
alias gaa='git add .'
alias gcm='git commit'

[ -x ~/opt/anaconda3/bin/python3 ] && alias -s py='~/opt/anaconda3/bin/python3'
alias -s {tex,md}=$EDITOR
alias -s {png,jpg,bmp,pdf}='open -a Preview'

if type abbrev-alias > /dev/null 2>&1; then
  abbrev-alias -g G='| grep'
  abbrev-alias -g L='| less'
  abbrev-alias -g M='| more'
  abbrev-alias -g H='| head'
  abbrev-alias -g T='| tail'
  abbrev-alias -g A='| awk'
  abbrev-alias -g and='|'
fi
