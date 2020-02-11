# Shell Options
################

# Don't wait for job termination notification
set -o notify

# Don't use ^D to exit
set -o ignoreeof

# Use case-insensitive filename globbing
shopt -s nocaseglob

# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
shopt -s cdspell

# http://stackoverflow.com/questions/6418493/bash-variable-expansion-on-tab-complete
shopt -s direxpand

# History Options
##################

# Don't put duplicate lines in the history and clean up meaningless whitespace
export HISTCONTROL=ignoreboth

# Ignore some controlling instructions
export HISTIGNORE="[   ]*:&:bg:fg:exit"

# Whenever displaying the prompt, write the previous line to disk
export PROMPT_COMMAND="history -a"

# Aliases
##########

# Default to human readable figures
alias df='df -h'
alias du='du -h'

alias l='less -r'
alias m='less -r'
alias more='less -r'
alias less='less -r'

alias h='history'
alias cls='clear'

alias g='egrep -i --color'
alias grep='egrep --color'

alias vi='vim'
alias gi='gvim'
alias ..='cd ..'

alias ls='ls -hF --color=tty'
alias dir='ls '
alias vdir='ls --color=auto --format=long'
alias dirs='dirs -v'
alias ll='ls -l'
alias la='ls -A'
alias lr='ls -R'

# Other
########

export EDITOR=vim
export VISUAL=vim
