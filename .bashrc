#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
export PATH="$PATH:/usr/local/go/bin"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias n='nnn'
PS1='[\u@\h \W]\$ '

export NNN_BMS="c:$HOME/Documents/Programs/;b:$HOME/Documents/Books/;s:$HOME/Documents/Study Materials/SEM-VI/;d:$HOME/Documents/;D:$HOME/Downloads/"
. /usr/share/nvm/init-nvm.sh
