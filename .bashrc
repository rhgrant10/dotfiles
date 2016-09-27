source ~/.bash_prompt
source ~/.bash_aliases
export EDITOR=vim

if [ -s /etc/environment ]; then
    . /etc/environment
else
    http_proxy=http://no-proxy.app.c9.equifax.com:3128
    https_proxy=http://no-proxy.app.c9.equifax.com:3128
    ftp_proxy=http://no-proxy.app.c9.equifax.com:3128
    no_proxy=localhost,127.0.0.1 
fi
export http_proxy https_proxy ftp_proxy no_proxy

if which thefuck > /dev/null; then
    eval $(thefuck --alias)
fi

source ~/praxis-airflow-helper.sh
