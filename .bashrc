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

function kip() {
    if [ -n "$1" ]; then
        partial="$1"
    else
        partial="default"
    fi
    ips=$(grep hostname .kitchen/*${partial}* | awk '{ print $2 }')
    echo $ips
}

if [ -s ~/code/openrc.sh ]; then
    source ~/code/openrc.sh
fi

export EDITOR=vim

if grep --quiet proxy /etc/environment; then
    . /etc/environment
else
    http_proxy=http://no-proxy.app.c9.equifax.com:3128
    https_proxy=http://no-proxy.app.c9.equifax.com:3128
    ftp_proxy=http://no-proxy.app.c9.equifax.com:3128
    no_proxy=localhost,127.0.0.1 
fi
export http_proxy https_proxy ftp_proxy no_proxy

if which thefuck > /dev/null 2>&1; then
    eval $(thefuck --alias)
fi

export PATH="${PATH}:${HOME}/.chefdk/gem/ruby/2.3.0/bin"
export KITCHEN_LOCAL_YAML="${HOME}/code/kitchen.local.yml"

if [ -s ~/praxis-airflow-helper.sh ]; then
    source ~/praxis-airflow-helper.sh
fi
