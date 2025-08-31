 sudo apt-get update;
 PACKAGES=(stow lsd starship bat "fd-find" zip unzip fzf delta ripgrep helix "tree-sitter" zoxide)
 for pkg in "${PACKAGES[@]}"; do
   if sudo apt-get install -y --no-install-recommends "$pkg" > /dev/null 2>&1; then
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

stow  -t ~ claude config wezterm starship zsh --adopt

