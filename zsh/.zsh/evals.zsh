eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
source <(fzf --zsh)
if [ "$TERMINAL_INFO" != "ALACRITTY" ]; then
  eval "$(starship init zsh)"
fi
