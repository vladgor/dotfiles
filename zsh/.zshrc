export EDITOR=nvim
export TERMINAL=kitty
export PATH=$PATH:/home/pppp/.gem/ruby/2.4.0/bin/
export PATH=$PATH:/home/pppp/.config/composer/vendor/bin/

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt notify
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt extended_history
unsetopt appendhistory beep
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/vladgor/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

bindkey -v
export KEYTIMEOUT=1

# Use vim cli mode
bindkey '^P' up-history
bindkey '^N' down-history
#
# # backspace and ^h working even after
# # returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
#
# # ctrl-w removed word backwards
bindkey '^w' backward-kill-word
# # ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

# No cd anymore
setopt autocd

setopt extended_glob

setopt interactive_comments

# Tab-completion from both ends of word
setopt completeinword

# One history for all open shells
setopt sharehistory
setopt extendedhistory

# Customized shell prompt
source ~/.zsh/themes/minimal.sh

# Alias section
alias ll='ls -lAh'
alias l='ls'
alias notes='vim ~/var/notes/ -c "cd ~/var/notes/" -c "FzfFiles"'
alias work='vim ~/var/notes/work -c "cd ~/var/notes/work/" -c "FzfFiles"'

# Git aliases
alias gs='git status'
alias ga='git add .'
alias gu='git add -u'
alias gc='git commit'
alias gco='git checkout'
alias gm='git merge'
alias gl='git log --graph --abbrev-commit --decorate --format=format:"%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n""          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)" --all'
alias gd='git diff HEAD'
alias gd~='git diff HEAD~1'
alias nah="git reset --hard && git clean -df"

# Ack aliases
alias ack="ack --ignore-file=is:tags --pager 'less -r'"

alias vim="nvim"

WORDCHARS='*?[]~=&;!#$%^(){}<>'

# Plugins section

# Syntax higlighting
# Must be at the end of this file
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

function up {
  eval "nohup sudo -i > /dev/null && cd ~/src/work/$1 && vagrant up && vagrant ssh"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
