#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure our custom themes will be found
fpath=( ~/.zpreztothemes "${fpath[@]}" )


# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Load Tmux on start of new session
if [[ ! $TERM =~ screen ]]; then
    exec tmux
fi

# MAKE DER ZSH SING FOR ITS SUPPER
autoload -Uz compinit promptinit
compinit
promptinit
prompt spenserj

## Lets set some options
setopt correctall
setopt autocd
setopt auto_resume
setopt extendedglob
setopt completeinword
unsetopt caseglob

## Set some ZSH auto complete options
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'

## History stuffs
HISTFILE=~/.zsh-histfile
HISTSIZE=10000
SAVEHIST=10000
setopt incappendhistory
setopt sharehistory
setopt extendedhistory

#ALIASES
##ls, the common ones I use a lot shortened for rapid fire usage
alias ls='ls --color' #I like color
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias logs='sudo tail -fn 25 /var/log/httpd/error_log'

source "$HOME/.homesick/repos/homeshick/homeshick.sh"

export PATH="$PATH:$HOME/.rubies/ruby-2.1.3/bin:/usr/bin/sass:/usr/bin/phpstorm/bin"
export DISPLAY=localhost:102
