# straight up stolen from noopkat/dotfiles
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
# git
# https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
source ~/bin/git-completion.bash
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
source ~/bin/git-prompt.sh

export GIT_PS1_SHOWDIRTYSTATE=true 
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWCOLORHINTS=true

# prompt
# I use Dracula theme for my terminal colours https://draculatheme.com
export PS1='🦄 \[\e[0;36m\]\[\e[0;36m\] \W\[\033[0;35m\]$(__git_ps1 " (%s)")\[\e[0m\]: '
