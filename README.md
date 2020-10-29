# dotfiles
Dotfiles for bash, tmux, and vim

Note: For `.vimrc` setup instructions please refer to [this repo](https://github.com/tomwhross/dotvimrc)

## Setup

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

Source the `.bash_profile` to generate the symlinks

```
$ source .bash_profile
```

Start vim and install the plugins

```
$ vim
: PlugInstall
```
