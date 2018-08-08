# This doesn't get read by bash on centos, but it
# does get read by bash on osx. Keep life simple
# and just include the rc.

# if running bash include .bashrc if it exists
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

