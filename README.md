# dotfiles

## set up fresh vim:
1. clone repo into working directory `git clone https://github.com/carylwyatt/dotfiles.git`
1. copy .vimrc to user directory `cp .vimrc ~/.vimrc`
1. install Vundle `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
1. launch vim and run `:PluginInstall` 

## powerline fonts and symbols

Mostly followed these instructions: 
- [How can I install and use powerline plugin](https://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin)
- [Powerline fonts repo](https://github.com/powerline/fonts)

### symbols
1. `wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf`
1. `https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf`
1. `sudo mv PowerlineSymbols.otf /usr/share/fonts/`
1. `sudo fc-cache -vf`
1. `sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/`
1. restart terminal

### fonts
This took me forever to figure out, but it was as simple as cloning the powerline fonts repo and moving folders around :shrug:

1. `git clone https://github.com/powerline/fonts.git`
1. `mv fonts/SourceCodePro /usr/share/fonts/`
1. `sudo fc-cache -vf`
1. restart terminal
1. open terminal preferences: Edit > Preferences
1. on the appearance tab, use dropdown to select font

## oh-my-zsh

Need to edit this to include zsh settings
