if ls --color > /dev/null 2>&1; then
  alias ls='ls --color'
else
  alias ls='ls -G'
fi

alias grep='grep --color=auto'
alias igrep='igrep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias zgrep='zgrep --color=auto'
alias zegrep='zegrep --color=auto'
alias zfgrep='zfgrep --color=auto'
alias python='python -B'

which colordiff 2>&1 > /dev/null && alias diff='colordiff'
