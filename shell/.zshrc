# https://geoff.greer.fm/lscolors/
export CLICOLOR=1
export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

export EDITOR=nvim
export VISUAL=nvim

export DOTFILES=~/dotfiles
export GITHUB=~/github
export PATH="$PATH:$DOTFILES/bin:$(yarn global bin)"
export PATH="$PATH:$DOTFILES/bin:$HOME/.gem/ruby/2.4.0/bin"
export CDPATH=".:$HOME:$DOTFILES:$GITHUB:$CDPATH"
export VIRTUAL_ENV_DISABLE_PROMPT=1

alias vi=$EDITOR
alias vim=$EDITOR
alias sudo="sudo -E"
alias reload="exec zsh"
alias mkdir="mkdir -p"
alias grep="rg"
alias ls="ls -AF --color=always"
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias gs="git status"
alias ga="git add"
alias gall="git add . -A"
alias grm="git rm -r"
alias gc="git commit -m"
alias gp="git push"
alias py="python"
alias shellcheck="shellcheck -x"

# Automatically ls after cd.
chpwd() { ls }

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# History settings
HISTFILE=~/.zhistory
HISTSIZE=10000000
SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY    # Write format.
setopt INC_APPEND_HISTORY  # Write to history file immediately.
setopt SHARE_HISTORY       # Share history between sessions.
setopt HIST_SAVE_NO_DUPS   # No saving of duplicates.
setopt HIST_IGNORE_SPACE   # No saving of events starting with a space.
setopt HIST_FIND_NO_DUPS   # No display of prevously found event.
setopt HIST_VERIFY         # No immediate execute on expansion.

autoload -U promptinit; promptinit
prompt pure

# Completion
zmodload zsh/complist
autoload -U compinit && compinit

zstyle ':completion:*' group-name ''
zstyle ':completion:*' format '%B---- %d%b'
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose true
zstyle ':completion:*:warnings' format 'Too bad there is nothing'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR"  -eq 1 ]; then
  exec startx &> /dev/null
fi

source $DOTFILES/zshrc/plugins.zsh
source $DOTFILES/zshrc/python.sh

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if command -v rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi