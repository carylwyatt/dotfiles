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
# the problem: the textutil convert step uses ANSI instead of UTF-8 or vice versa
# cat the file with the issue followed by the pandoc and textutil steps below; look for the offending character and replace like the SED commands below
# in case you need to do this again, here's a decent ANSI table: http://www.alanwood.net/demos/ansi.html
SED="s|\\\'e2\\\'80\\\'99|\\\'92|g"; export SED
SEDLEFTQUOTE="s|\\\'e2\\\'80\\\'9c|\\\'93|g"; export SEDLEFTQUOTE
SEDRIGHTQUOTE="s|\\\'e2\\\'80\\\uc0\\\u157|\\\'94|g"; export SEDRIGHTQUOTE


# to use: `$ cat file.md | md` -> copies md file to clipboard for pasting elsewhere
alias md='pandoc --from markdown --to html | textutil -convert rtf -stdin -stdout -format html | sed $SED |sed $SEDLEFTQUOTE | sed $SEDRIGHTQUOTE | pbcopy -Prefer rtf'

# copy html from file to clipboard (this is tricky in vim)
# to use: `$ cat file.html | html`
alias html='pbcopy -Prefer html'

# open file in chrome 
# to use: `$ chrome index.html`
alias chrome='open -a "Google Chrome"' 

# ls colors
export CLICOLOR=1
export LSCOLORS=Fxfxcxdxbxegedabagacad

