if ls --color 2>&1 > /dev/null; then
  alias ls='ls --color'
else
  alias ls='ls -G'
fi

alias python='python -B'

