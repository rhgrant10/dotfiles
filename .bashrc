source ~/.bash_prompt
source ~/.bash_aliases

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
