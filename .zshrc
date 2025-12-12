#history
HISTSIZE=1000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

#beep
setopt nobeep
setopt autocd

#autocomplete
autoload -Uz compinit && compinit
autoload -Uz promptinit && promptinit
autoload -Uz add-zsh-hook vcs_info
setopt prompt_subst
add-zsh-hook precmd vcs_info
setopt complete_in_word
zstyle ':completion:*' completer _expand _complete _prefix _approximate
zstyle ':completion:*' matcher-list \
  '' \
  'm:{a-zA-Z}={A-Za-z}' \
  'r:|[.,_-]=* r:|=*' \
  'l:|=* r:|=*'
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'
zstyle ':completion:*' prefix-needed false
zstyle ':completion:*' ignore-parents parent pwd ..
[[ -z "$LS_COLORS" ]] && eval "$(dircolors -b)"
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

#formatting
PS1="%F{#9ccfd8}${vcs_info_msg_0_}%f%F{#00c5d9}%n%f %~ %F{#f6c177}>>%f "
TIMEFMT=$'\n%J\nuser\t%U\nsystem\t%S\ntotal\t%E'

#keybinds
bindkey -v
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

#aliases
alias vim='nvim'
alias vi='nvim'
alias ls='ls --color'
alias la='ls -a --color'
alias lh='ls -df .??* --color'
alias grep='grep --color'
alias fcd='cd $(find . -type d -print | fzf)'

#PATH
typeset -U path
path=($path $HOME/.dotnet/tools $(go env GOPATH)/bin)

#zoxide
eval "$(zoxide init zsh)"
alias cd='z'
