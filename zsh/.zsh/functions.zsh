tmux_attach() {
  local remote="$1"
  ssh "$remote" bash -s < ~/.tmux.conf <<'EOF'
tmux run-shell "tmux source-file -"
tmux attach
EOF
}


tmux_new() {
  local remote="$1"
  local session="$2"
  local config="$HOME/.tmux.conf"

  if [[ -z "$remote" || -z "$session" ]]; then
    echo "Usage: tmux_new user@host session-name"
    return 1
  fi

  # Send the config in a separate SSH command (no stdin redirection)
  ssh "$remote" "cat > /tmp/.tmux_conf_$$" < "$config"

  # Now attach with a PTY and apply the config
  ssh -t "$remote" "bash -c '
    if ! tmux has-session -t \"$session\" 2>/dev/null; then
      tmux new-session -d -s \"$session\"
    fi
    tmux source-file /tmp/.tmux_conf_$$
    rm /tmp/.tmux_conf_$$
    tmux attach-session -t \"$session\"
  '"
}

echo "Sourcing the functions"
