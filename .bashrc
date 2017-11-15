source ~/.bash_prompt
source ~/.bash_aliases


# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Determine what we're running on here.
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

if [ -x /usr/bin/byobu-launch ]; then
    _byobu_sourced=1 . /usr/bin/byobu-launch
fi

export EDITOR=vim

if which thefuck > /dev/null 2>&1; then
    eval $(thefuck --alias)
fi

