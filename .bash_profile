export LANG=ja_JP.UTF-8

# search /usr/local/bin before /usr/bin
# to find homebrew-ed module first
export PATH="/usr/local/bin:${PATH}"

export PATH="${HOME}/.nodebrew/current/bin:${PATH}"
export PATH="${HOME}/.rbenv/bin:${PATH}"
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:${PATH}"
export PATH="/usr/local/heroku/bin:${PATH}"

# Ansible
# specify an inventory file location, instead of /etc/ansible/hosts
export ANSIBLE_INVENTORY=~/ansible_hosts
export ANSIBLE_COW_SELECTION=random

# golang
export GOPATH=$HOME
export PATH="$PATH:$GOPATH/bin"

export HGENCODING=utf-8

test -r ~/.bashrc && . ~/.bashrc
