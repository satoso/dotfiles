alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias ls='ls -alF'

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# search /usr/local/bin before /usr/bin
# to find homebrew-ed module first
export PATH="/usr/local/bin:$PATH"

# PS1='\h:\W \[\e[1;34m\]\u\$\[\e[0m\] '
# PS1='\[\e[0;34m\]\W \$\[\e[0m\] '

# bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
  # git-prompt
  . /usr/local/etc/bash_completion.d/git-prompt.sh
  # for Tomorrow night theme on Terminal.app
  # PS1='\[\e[44m\]\W $(__git_ps1 "(%s)")\$\[\e[0m\] '

  # PS1='\[\e[0;32m\]\u\[\e[0m\]: '
  PS1='\[\e[0;34m\]\W\[\e[0m\]'
  PS1+='$(__git_ps1 " \[\e[0;35m\][%s]\[\e[0m\]")\[\e[0m\] '
  PS1+='\$ '
fi

if [ -d ~/projects ]; then
  cd ~/projects
fi

