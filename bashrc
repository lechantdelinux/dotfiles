#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# For Synctex
alias vim='vim --servername vim'

# List sound cards
alias soundcards='cat /proc/asound/cards'
