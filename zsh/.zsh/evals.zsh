eval "$(zoxide init zsh)"
source <(fzf --zsh)
# Terminals that support oh-my-posh prompt
local _omp_terminals=(ghostty WezTerm alacritty)
if (( ${_omp_terminals[(Ie)$TERM_PROGRAM]} )); then
  eval "$(oh-my-posh init zsh --config '~/.config/themes/amro.yaml')"
fi
