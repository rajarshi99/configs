# Enable colors and change prompt
autoload -U colors && colors
PS1="
%B%{$fg[blue]%}%~%{$reset_color%}%b
> "

# Custom Variables
EDITOR=nvim

# vi mode
bindkey -v

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zshhistory
setopt appendhistory
bindkey '^R' history-incremental-search-backward

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)               # Include hidden files.

# Custom ZSH Binds
bindkey '^ ' autosuggest-accept

alias qq=exit
alias vim=nvim

alias edit="emacsclient --create-frame --alternate-editor=\"vi\""

ZLE_REMOVE_SUFFIX_CHARS=""

# For Intel mkl
alias mkl=". /opt/intel/oneapi/setvars.sh intel64"
alias euclid='ssh -N -L localhost:9090:localhost:9090 rajarshi@10.24.36.23'
alias zotero='/home/rajarshi/Zotero_linux-x86_64/zotero'

# Load ; should be last.
source /home/rajarshi/.config/zsh/zsh-fzf-history-search.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg=blue

