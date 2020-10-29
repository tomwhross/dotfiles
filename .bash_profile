# bash autocomplete config
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# pyenv
eval "$(pyenv init -)"

# force prompt colors
# mainly for tmux
force_color_prompt=yes

# Maven (mvn) config
export M2_HOME=/usr/local/Cellar/maven/3.6.2/libexec
export M2=${M2_HOME}/bin
export PATH=${PATH}:${M2_HOME}/bin

source ~/git_venv_prompt.sh

# c docker stuff

function crun(){
    docker run --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp vulture/gcc-valgrind-cunit /usr/src/myapp/"$1"
}

function cval(){
    docker run --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp vulture/gcc-valgrind-cunit valgrind /usr/src/myapp/"$1"
}

function cpile(){
    docker run --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp vulture/gcc-valgrind-cunit gcc -o "$1" "$2"
}

# make directory and change to directory
# Usage $ mcd ../dir
function mcd () {
	mkdir -p "$1"
	cd "$1" || exit
}

# for vim soliarized theme
sh .vim/pack/themes/opt/solarized8/scripts/solarized8.sh

# aliases
alias av="source bin/activate"
alias cl=clear
alias v="vim ."

