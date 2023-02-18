alias bootstrap='$HOME/.yadm/bootstrap'
alias c='zz'
alias cat='bat -np --paging=never --theme base16'
#alias diff='icdiff -N'
alias dmesg='sudo dmesg'
alias g='git'
alias htop='sudo htop'
alias ls='ls --color=auto'
alias k='kubectl'
alias kctx='kubectx'
alias kns='kubens'
alias kubeon='kpst'
alias wpo='watch "kubectl get pods -o wide"'
alias rg='rg -i'
alias t='true'
alias tf='terraform'
alias ym='yadm'
alias zreload='exec $SHELL -l'
alias to-ansible="cd ~/repo/ansible && source utils/venv-init.sh"
alias df="pydf"
alias epoch="date +%s"
alias cal="cal -m"
alias dig="dig +nocomments"
alias clip="xclip -selection clipboard"
alias dnf="sudo dnf"
alias s="sudo systemctl"
alias example='f() { echo Your arg was $1. };f'
alias awswho='aws sts get-caller-identity'
alias cdr='cd ~/repo'

if command -v nvim > /dev/null 2>&1; then
  alias vim='nvim'
  alias vimdiff='nvim -d'
fi
