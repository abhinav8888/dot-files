sudo add-apt-repository ppa:maveonair/helix-editor
sudo apt-get update
PACKAGES=(stow lsd starship bat "fd-find" zip unzip delta ripgrep helix "tree-sitter" zoxide gh)
for pkg in "${PACKAGES[@]}"; do
  if sudo apt-get install -y --no-install-recommends "$pkg" >/dev/null 2>&1; then
    echo "Package $pkg installed"
  else
    echo "Skipped $pkg"
  fi
done

if command -v lazygit >/dev/null 2>&1; then
  echo "✅ Lazygit is already installed at $(which lazygit)"
  lazygit --version
else
  LATEST=$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep tag_name | cut -d '"' -f 4)
  curl -L -o lazygit.tar.gz https://github.com/jesseduffield/lazygit/releases/download/${LATEST}/lazygit_${LATEST/v/}_linux_arm64.tar.gz
  sudo tar -xf lazygit.tar.gz -C $HOME/.local/bin/
  rm lazygit.tar.gz lazygit
fi

if command -v fzf >/dev/null 2>&1 && [[ "$(fzf --version)" == "0.65.2"* ]]; then
  echo "✅ Latest fzf is already installed at $(which fzf)"
  fzf --version
else
  echo "Installing latest fzf..."
  curl -L https://github.com/junegunn/fzf/releases/download/v0.65.2/fzf-0.65.2-linux_arm64.tar.gz -o fzf.tar.gz
  tar -xf fzf.tar.gz
  sudo mv fzf /usr/local/bin/fzf
  rm fzf.tar.gz
  echo "✅ fzf installed at $(which fzf)"
  fzf --version
fi

if command -v zellij >/dev/null 2>&1 && [[ "$(zellij --version)" == "zellij 0.43.1"* ]]; then
  echo "✅ Latest zellij is already installed at $(which zellij)"
  zellij --version
else
  echo "Installing latest zellij..."
  ZELLIJ_LATEST=$(curl -s https://api.github.com/repos/zellij-org/zellij/releases/latest | grep tag_name | cut -d '"' -f 4)
  curl -L -o zellij.tar.gz https://github.com/zellij-org/zellij/releases/download/${ZELLIJ_LATEST}/zellij-aarch64-unknown-linux-musl.tar.gz
  tar -xf zellij.tar.gz
  sudo mv zellij /usr/local/bin/zellij
  rm zellij.tar.gz
  echo "✅ zellij installed at $(which zellij)"
  zellij --version
fi

stow -t ~ claude config wezterm starship zsh --adopt
