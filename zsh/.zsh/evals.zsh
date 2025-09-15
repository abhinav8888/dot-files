# eval "$(starship init bash)"
eval "$(zoxide init bash)"
eval "$(fzf --bash)"
eval "$(direnv hook bash)"
export $(cat $HOME/.claude/settings.env | xargs )
