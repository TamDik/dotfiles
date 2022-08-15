# alias
alias sudo='sudo '
alias vim='nvim'
alias vimdiff='nvim -d'
if type brew > /dev/null 2>&1; then
  alias ctags="`brew --prefix`/bin/ctags"
fi
alias ipython='ipython --pylab'
if [ `uname` = 'Darwin' ]; then
  alias ls='ls -FG'
  alias la='ls -aFG'
  alias ll='ls -lhFG'
  alias lla='ls -alhFG'
elif [ `uname` = 'Linux' ]; then
  alias ls='ls -F --color=always'
  alias la='ls -aF --color=always'
  alias ll='ls -lhF --color=always'
  alias lla='ls -alhF --color=always'
fi
alias tree='tree -NC -l'

alias history-all='history -E 1 '

alias du='du -h'
alias df='df -h'

alias gst='git status'
alias gdf='git diff'
alias gaa='git add .'
alias gcm='git commit'

if type abbrev-alias > /dev/null 2>&1; then
  abbrev-alias -g G='| grep'
  abbrev-alias -g L='| less'
  abbrev-alias -g M='| more'
  abbrev-alias -g H='| head'
  abbrev-alias -g T='| tail'
  abbrev-alias -g A='| awk'
  abbrev-alias -g and='|'
fi
