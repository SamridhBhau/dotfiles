#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias n='nnn'
PS1='[\u@\h \W]\$ '

source /usr/share/nvm/init-nvm.sh
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"

export PIPENV_VENV_IN_PROJECT=1
export NNN_BMS="c:$HOME/Documents/Programs/;b:$HOME/Documents/Books/;s:$HOME/Documents/Study Materials/SEM-VI/;d:$HOME/Documents/;D:$HOME/Downloads/"

eval `ssh-agent -s`
. "$HOME/.cargo/env"

export GOPATH="$(go env GOPATH)"
export PATH="${PATH}:${GOPATH}/bin"

