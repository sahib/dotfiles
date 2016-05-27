# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
# export ZSH_THEME="pygmalion"
# export ZSH_THEME="lambda"
export ZSH_THEME="norm"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ssh-agent zsh-syntax-highlighting cp lastest-working-dir python taskwarrior)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# For yaourt 
export EDITOR="vim"

#Setting to links because this is only important for man pages 
export BROWSER=links 

# for.. whatever.. 
export XTERM="urxvt +sb"
export TERM=xterm-256color

# Keys:
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^[[5~' up-line-or-history
bindkey '^i' expand-or-complete-prefix

alias irc='irssi'
alias chat='profanity'
alias mail='alot'
alias glibvg='G_DEBUG=gc-friendly G_SLICE=always-malloc valgrind --leak-check=full --show-possibly-lost=no'
alias ncmpc='ncmpc -c'

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

export PATH="/usr/lib/ccache/bin/:$PATH"
export PATH="/usr/lib/cw:$PATH"
export PATH="$GOBIN:$PATH"
export PATH="/usr/bin/vendor_perl:$PATH"
export PATH="/home/$USER/bin/:$PATH"

# enable coredumps
ulimit -c unlimited

export _humblebundle4key=3SzuexCAr35G
export LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'
export SUDO_EDITOR="/usr/bin/vim -p -X"

alias ll=ls++

# Vim Server/Client
alias vims='gvim --servername GVIM --remote-tab'
alias gvim='gvim --servername GVIM'

# this is deprecated
export GREP_OPTIONS=

# Go stuff:
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export GOBIN=$GOPATH/bin

# brig stuff:
alias brig-task="TASKRC=~/.brig-taskrc task"
alias brig-vit="TASKRC=~/.brig-taskrc vit"
