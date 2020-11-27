# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
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
plugins=(git ssh-agent zsh-syntax-highlighting cp lastest-working-dir python)

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

source $ZSH/oh-my-zsh.sh

export EDITOR="nvim"
export BROWSER=firefox
export XTERM="kitty"
export TERM=xterm-kitty

# Keys:
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^[[5~' up-line-or-history
bindkey '^i' expand-or-complete-prefix

# For C-debugging:
alias glibvg='G_DEBUG=gc-friendly G_SLICE=always-malloc valgrind --leak-check=full --show-possibly-lost=no'

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

export LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'
export SUDO_EDITOR="/usr/bin/vim -p -X"

alias ll=ls++

# this is deprecated
export GREP_OPTIONS=

# Go stuff:
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export GOBIN=$GOPATH/bin

export GPG_TTY=$(tty)
export TERMINAL=kitty

# Causes valid commands to be turned green:
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Because my fingers don't learn new tool names anymore:
alias ag=rg
alias vi=nvim
alias vim=nvim

# brig development:
alias ali='brig --repo /tmp/ali'
alias bob='brig --repo /tmp/bob'
source ~/code/brig/autocomplete/zsh_autocomplete

# Make fzf pretty by default:
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --preview 'bat --style=numbers --color=always --line-range :100 --theme=\"gruvbox-light\" {}'"
alias gdk='git difftool --no-symlinks --dir-diff'

[ -f "~/.zshrc.extra" ] && source "~/.zshrc.extra"
