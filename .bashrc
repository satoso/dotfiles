# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Source global definitions
test -r /etc/bashrc && . /etc/bashrc

if [ "$(uname)" == 'Darwin' ]; then
  # Mac (note that 'expr substr' isn't available on Mac)
  :  # do nothing
elif [ "$(expr substr $(uname -s) 1 6)" == 'CYGWIN' ]; then
  # Cygwin

  # ignore CR's in scripts
  # http://chess.eecs.berkeley.edu/softdevel/faq/5.html
  # export SHELLOPTS
  # set -o igncr

  # `ln` to create windows-symlinks
  export CYGWIN="winsymlinks:native"
fi

which rbenv >/dev/null 2>&1 && eval "$(rbenv init -)"
which pyenv >/dev/null 2>&1 && eval "$(pyenv init -)"

# cancel association of ctrl-s to 'stop'
# in reverse search(ctrl-r), ctrl-s is now available for moving forward
stty stop undef

# bash-completion
brew_prefix=''
if which brew >/dev/null 2>&1 ; then
  brew_prefix="$(brew --prefix)"
fi
test -r "${brew_prefix}/etc/bash_completion" && source "${brew_prefix}/etc/bash_completion"
test -r "${brew_prefix}/etc/bash_completion.d/git-prompt.sh" && source "${brew_prefix}/etc/bash_completion.d/git-prompt.sh"

# prompt
PS1='[\u@\h \W]'
if type __git_ps1 >/dev/null 2>&1 ; then
  PS1+='\[\e[0;35m\]$(__git_ps1 ":%s ")\[\e[0m\]'    # git branch name
fi
PS1+='\$ '

# aliases
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
if [ "$(uname)" == 'Darwin' ]; then
  alias ls='ls -G'
  alias ll='ls -lG'
else
  alias ls='ls --color=auto'
  alias ll='ls -l --color=auto'
fi
alias be='bundle exec'
alias macvim='open -a /Applications/MacVim.app'
