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

Source the bash_profile one last time to ensure the solarized8 script runs

```
$ source ~/.bash_profile
```


### One-liner

```
$ git clone git@github.com:tomwhross/dotfiles.git && cd dotfiles && git submodule init && git submodule update && source bash_profile && lnkdots && vim +PlugInstall +qall && source ~/.bash_profile
```
