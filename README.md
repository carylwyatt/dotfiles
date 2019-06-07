# dotfiles

## set up fresh vim:
1. check the version of vim: `vim --version`
   * if <8, upgrade!
   * `brew install vim` did the trick on macOS
   * ubuntu:
     * had to add `add-apt-repository` ability: `sudo apt-get install -y software-properties-common`
     * `sudo add-apt-repository ppa:jonathonf/vim`
     * `sudo apt-get update`
     * `sudo apt-get install vim`
1. clone repo into working directory `git clone https://github.com/carylwyatt/dotfiles.git`
1. copy .vimrc to user directory `cp .vimrc ~/.vimrc`
1. install Vundle `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
1. launch vim and run `:PluginInstall` 

## if you want all the magic of my bash setup
1. `cp .bash_profile ~/.bash_profile`
1. `cp .git-prompt.sh ~/.git-prompt.sh`
1. `brew install git bash-completion`

if ubuntu, you'll need to add this line to the bottom of `~/.bashrc`:
* `. ~/.bash_profile`
* if you're still getting a bash error about `PS1`, try: `sudo apt-get install git-core bash-completion` to double check git-completion installed properly

## iterm settings

- follow instrcutions at [dracula for iterm](https://draculatheme.com/iterm/) for setting iterm theme
- key remaps:
  - change right command key to control
  - change "to switch panes" to opt-number
- once you've installed powerline fonts and symbols, head to preferenes > profiles > text and change font under Font to `source code pro` and Non-ASCII Font to `PowerlineSymbols`

## powerline fonts and symbols

***For whatever reason, great fonts and symbols are automagically included in ubuntu 18.04, so no need to install any of these powerline fonts unless you really want them! However, you'll probably want emoji support for your unicorn, so `sudo apt-get install fonts-emojione`***

Mostly followed these instructions: 
- [How can I install and use powerline plugin](https://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin)
- [Powerline fonts repo](https://github.com/powerline/fonts)
- *on macos, you still clone the repos below, but just click the + icon in fontbook and select that folder to add them to your system*

### symbols
1. `wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf`
1. `wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf`
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
1. while you have preferences open, on the advanced tab, change the default character encoding to utf-8 (unicode)

## oh-my-zsh

### macOS

Since macOS Catalina will be changing the default shell from bash to zsh, I've started working on tricking out my zsh setup. Of course I'm using oh my zsh, so head to [their homepage](https://ohmyz.sh) for install instructions. Then:

1. `cp .zshrc ~/.zshrc`
1. `cp agnoster.zsh-theme ~/.oh-my-zsh/themes/agnoster.zsh-theme`

I spent a few hours trying to figure out why my agnoster symbols didn't match their README images... turns out the agnoster file shipped with the oh my zsh install is out of date. Mine is the latest (as of June 2019).

One other change I made in iTerm is under Preferences > Profiles > Colors: change Black to 20% Gray (you can choose this options when you click on the black square under "Normal") so it's not so starkly black behind the unicorn emoji.

*On macOS, I had issues with the stupid `^M` carriage returns in the zsh files and got a "parse error". See [parse errors issue](https://github.com/robbyrussell/oh-my-zsh/issues/4870) in the oh my zsh repo for the workaround.* 

### linux

Getting powerline fonts and symbols set up for oh-my-zsh was a whole thing, and I finally figured out why: I had all my font config stuff "installed" in my /home/caryl (user) files but for zsh, they needed to be installed/configured in the ~ (root) files. 

Oy. All of the above is still valid, it just needs to go in two places??

Can't really believe it's working, but it is! Here's the installation I followed:
- [zsh and oh-my-zsh for linux](https://www.howtoforge.com/tutorial/how-to-setup-zsh-and-oh-my-zsh-on-linux/)
- [set oh-my-zsh as default shell](https://medium.com/denix-daily/how-to-set-oh-my-zsh-as-a-default-shell-in-ubuntu14-04-bd2524fd7144)

## 256 colors

<del>
I've been struggling to get the xfce4-terminal to use 256 colors. This did the trick: [set $TERM to xterm-256color](https://bbs.archlinux.org/viewtopic.php?id=175581)</del>

<del>I had to create the application folder in the .local directory, but other than that, this worked! Now to figure out how to create a keyboard shortcut to launch *this* terminal instead of the default version.
</del>

**Update (Jan 2019):** Found a new way, and this legit works: [add if statement to end of `~/.bashrc`](https://stackoverflow.com/questions/19327836/why-am-i-seeing-only-8-colors-in-terminal-xfce-terminal)

```
if [ "$COLORTERM" == "xfce4-terminal" ] ; then
  export TERM=xterm-256color
fi
``` 
## f#@%-ing `^M` issues

DOS and UNIX files don't get along. I've had many issues in the past with the stupid LF vs CRLF line endings/carriage returns. Here's the official Github statement on it: [Dealing with line endings](https://help.github.com/en/articles/dealing-with-line-endings).

I have two settings globally:

```
git config --global core.autocrlf input
git config --global core.safecrlf false
```

You can check these settings in any git-enabled directory with `git config --list`. 

Most recently, these stupid `^M` errors threw off my entire vim setup after I decided it was a good idea to update all my plugins. I'm basically obsessed with my vim settings, so this was not only a pain in the ass but kind of terrifying. What ended up fixing it was deleting the plugins that were causing the issue (they live in `~/.vim/bundle`, use `rm -Rf [name of plugin directory]`) then re-installing the plugin via Vundle (`vim +PluginInstall +qall`).

## docker

if docker is giving you the docker deamon connection error, try:
* `sudo service docker start # Ubuntu/Debian`
