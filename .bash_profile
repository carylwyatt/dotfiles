# straight up stolen from noopkat/dotfiles
#export LC_ALL=en_US.UTF-8  
#export LANG=en_US.UTF-8

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
# git
# https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
#source ~/bin/git-completion.bash
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
#source ~/bin/git-prompt.sh

export GIT_PS1_SHOWDIRTYSTATE=true 
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWCOLORHINTS=true

# prompt
# I use Dracula theme for my terminal colours https://draculatheme.com
export PS1='🦄 \[\e[0;36m\]\[\e[0;36m\] \W\[\033[0;35m\]$(__git_ps1 " (%s)")\[\e[0m\]: '

# bat rules
alias cat='bat'

# cd to UA wordpress install
alias cdroots='cd /Applications/wordpress-5.0.3-2/apps/wordpress/htdocs/wp-content/themes/roots-ualib'

# markdown to rtf (see: ostricher.com, august 2015)
# had to do some sed replacement magic to fix an apostrophe encoding issue
SED="s|\\\'e2\\\'80\\\'99|\\\'92|g"; export SED

alias md='pandoc --from markdown --to html | textutil -convert rtf -stdin -stdout -format html | sed $SED | pbcopy -Prefer rtf'
