# dotfiles
Dotfiles for bash, tmux, and vim

Note: For `.vimrc` setup instructions please refer to [this repo](https://github.com/tomwhross/dotvimrc)
 - While the `dotvimrc` repo is no longer maintained, it can still be instructive in terms of laying out how my `.vimrc` file was built up from scratch

Note: there is currently a separate repo tracking my vscode settings which can be [found here](https://github.com/tomwhross/vscode)
 - I haven't looked into how to maintain vscode project settings in a repo and propagate them automatically
 - I am relying more on vim these days so it's becoming less important to me

## Setup - One-liner

Run the following whereever you want to store the `dotfiles` repo/directory, e.g. `~/`
 - The symlinks setup function is smart enough that the folder can be located anywhere
 
```
$ git clone git@github.com:tomwhross/dotfiles.git && cd dotfiles && git submodule init && git submodule update && source bash_profile && lnkdots && vim +PlugInstall +qall && source ~/.bash_profile
```

## Setup - Show you work

Start by cloning this repo

```
$ git clone git@github.com:tomwhross/dotfiles.git
$ cd dofiles/
```

Initialize and update the git submodules

```
$ git submodule init
$ git submodule update
```

Source the `bash_profile`

```
$ source bash_profile
```

Run `lnkdots` to install the symlinks

```
$ lnkdots
```

Install vim plugins

```
$ vim +PlugInstall +qall
```

Source the bash_profile one last time to ensure the solarized8 script runs and as a sanity check

```
$ source ~/.bash_profile
```
