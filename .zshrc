# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/uzer/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -Uz add-zsh-hook vcs_info
setopt prompt_subst
add-zsh-hook precmd vcs_info

autoload -Uz promptinit
promptinit
#Command prompt
PS1="%F{#9ccfd8}${vcs_info_msg_0_}%f%F{#00c5d9}%n%f %~ %F{#f6c177}>>%f "

#Aliases
alias "vim"="nvim" "vi"="nvim"
alias ls='ls --color=auto'
alias la='ls -a --color=auto'
alias lh="ls -df .??* --color=auto"
alias ln='ls -lan'
alias grep='grep --color=auto'
alias fcd='cd $(find . -type d -print | fzf)'

#dotnet tools
export PATH="$PATH:$HOME/.dotnet/tools"

#zoxide
eval "$(zoxide init zsh)"
alias cd='z'
