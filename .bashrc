# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

if [ "$(uname)" == 'Darwin' ]; then
  # Mac
  # note that 'expr substr' isn't available on Mac
  true  # do nothing
elif [ "$(expr substr $(uname -s) 1 6)" == 'CYGWIN' ]; then
  # Cygwin

  # ignore CR's in scripts
  # http://chess.eecs.berkeley.edu/softdevel/faq/5.html
  export SHELLOPTS
  set -o igncr
fi

# search /usr/local/bin before /usr/bin
# to find homebrew-ed module first
export PATH="/usr/local/bin:${PATH}"

# for nodebrew
export PATH="${HOME}/.nodebrew/current/bin:${PATH}"

# for rbenv
export PATH="${HOME}/.rbenv/bin:${PATH}"
if which rbenv &>/dev/null; then
  eval "$(rbenv init -)"
fi

# for pyenv
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:${PATH}"
if which pyenv &>/dev/null; then
  eval "$(pyenv init -)"
fi

# for Mercurial
export HGENCODING=utf-8

# for Heroku Toolbelt
export PATH="/usr/local/heroku/bin:${PATH}"

# cancel association of ctrl-s to 'stop'
# in reverse search(ctrl-r), ctrl-s is now available for moving forward
stty stop undef

# bash-completion
brew_prefix=''
if which brew &>/dev/null; then
  brew_prefix="$(brew --prefix)"
fi
if [ -f "${brew_prefix}/etc/bash_completion" ]; then
  source ${brew_prefix}/etc/bash_completion
  source ${brew_prefix}/etc/bash_completion.d/git-prompt.sh
fi

# prompt
PS1='\[\e]0;\w\a\]' # set window title
PS1+='\n'  # newline
PS1+='\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]'  # user@host, current_directory
if type __git_ps1 &>/dev/null; then
  PS1+='\[\e[0;35m\]$(__git_ps1)\[\e[0m\]'    # git branch name
fi
PS1+='\n'  # newline
PS1+='\$ ' # prompt

# aliases
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias ls='ls -alFG'
alias be='bundle exec'
alias macvim='open -a /Applications/MacVim.app'
