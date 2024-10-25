alias sudo="sudo "
alias apt="dnf"

alias whereami="pwd"

alias ls="exa --icons"
alias lsl="ls -1"
alias lsa='ls -a'
alias lsla="ls -a -1"
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'

alias mkdir="mkdir -p"
alias md='mkdir'

alias ff="fzf --exact --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias goto='cd "$(find . -type d -name "$(fzf)" -print -quit)"'
alias gt="goto"

alias help="tldr"

alias fastfetch="fastfetch --config ~/.config/fastfetch.jsonc"
alias tree="tree -a ."
alias st="speedtest-cli"

alias clear="clear; fastfetch; echo "";"
alias cls="clear"
alias c="\clear"

alias x="exit"

alias -- -="cd -"
alias ..="cd .."
alias ...="cd ../../"