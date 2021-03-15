source ~/.bash_prompt
source ~/.bash_aliases

# history
shopt -s histappend
HISTFILESIZE=10000000
HISTSIZE=100000
HISTCONTROL=ignoreboth
HISTIGNORE="history"
HISTTIMEFORMAT="%F %T "

# misc
export EDITOR=vim
export GOPATH="${HOME}/code/go"

# include my stuff
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Determine what we're running on here.
# This abstracts the version specifics like "darwin19.0"
case "$OSTYPE" in
    linux*) RG_PLATFORM=linux;;
    darwin*) RG_PLATFORM=macos;;
    freebsd*) RG_PLATFORM=unix;;
esac

# Autocompletion on macs:
if [ "$RG_PLATFORM" == "linux" ]; then
    if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
        . /etc/bash_completion
    fi
elif [ "$RG_PLATFORM" == "macos" ]; then
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
    fi
fi

# use byobu if we have it
if [ -x /usr/bin/byobu-launch ]; then
    _byobu_sourced=1 . /usr/bin/byobu-launch
fi
# tf is handy af
if which thefuck > /dev/null 2>&1; then
    eval $(thefuck --alias)
fi

# bring in stuff at work... if at work
if [ -s ~/.bash_atwork ]; then
    source ~/.bash_atwork
fi
