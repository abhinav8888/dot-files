#!/usr/bin/env bash
set -euo pipefail

BIN_DIR="$HOME/.local/bin"
SHARE_DIR="$HOME/.local/share"
mkdir -p "$BIN_DIR" "$SHARE_DIR"

require_cmd() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "Missing required command: $1" >&2
    exit 1
  fi
}

echo "Checking prerequisites..."
for cmd in curl tar gunzip; do
  require_cmd "$cmd"
done

install_npm_global() {
  if command -v npm >/dev/null 2>&1; then
    npm install -g --prefix "$HOME/.local" "$@"
  else
    echo "npm not found; skipping $*" >&2
  fi
}

install_go_bin() {
  local pkg="$1"
  if command -v go >/dev/null 2>&1; then
    GOBIN="$BIN_DIR" go install "$pkg"
  else
    echo "go not found; skipping $pkg" >&2
  fi
}

install_pip_in_venv() {
  if command -v python >/dev/null 2>&1 && [ -n "${VIRTUAL_ENV:-}" ]; then
    python -m pip install "$@"
  else
    echo "python not found or no active virtualenv; skipping $*" >&2
  fi
}

os=$(uname -s | tr '[:upper:]' '[:lower:]')
arch_raw=$(uname -m)
case "$arch_raw" in
  x86_64|amd64)
    arch="x86_64" ;;
  aarch64|arm64)
    arch="arm64" ;;
  *)
    echo "Unsupported arch: $arch_raw" >&2
    exit 1 ;;
esac

echo "Detected OS: $os, Arch: $arch"

# tofu-ls
tofu_version="0.0.9"
tofu_url="https://github.com/opentofu/tofu-ls/releases/download/v${tofu_version}/tofu-ls_${os}_${arch}.tar.gz"
echo "Installing tofu-ls..."
tmpdir=$(mktemp -d)
trap 'rm -rf "$tmpdir"' EXIT
curl -fsSL "$tofu_url" | tar -xz -C "$tmpdir"
if [ -f "$tmpdir/tofu-ls" ]; then
  install -m 0755 "$tmpdir/tofu-ls" "$BIN_DIR/tofu-ls"
elif [ -f "$tmpdir/bin/tofu-ls" ]; then
  install -m 0755 "$tmpdir/bin/tofu-ls" "$BIN_DIR/tofu-ls"
else
  # Fallback: grab first tofu-ls found
  found=$(find "$tmpdir" -type f -name tofu-ls -print -quit)
  if [ -n "${found}" ]; then
    install -m 0755 "$found" "$BIN_DIR/tofu-ls"
  else
    echo "tofu-ls not found in archive" >&2
    exit 1
  fi
fi

# pyright
echo "Installing pyright..."
install_npm_global pyright

# pylsp
echo "Installing pylsp..."
install_pip_in_venv 'python-lsp-server[all]'

# ty (astral typechecking package for python)
echo "Installing ty..."
install_pip_in_venv ty

# typescript-language-server
echo "Installing typescript-language-server..."
install_npm_global typescript-language-server

# bash-language-server
echo "Installing bash-language-server..."
install_npm_global bash-language-server
if command -v bash-language-server >/dev/null 2>&1; then
  echo "bash-language-server installed: $(command -v bash-language-server)"
else
  echo "bash-language-server not on PATH; ensure ~/.local/bin is exported" >&2
fi

# gopls
echo "Installing gopls..."
install_go_bin golang.org/x/tools/gopls@latest

echo "Installing shfmt (Bash formatter)..."
install_go_bin mvdan.cc/sh/v3/cmd/shfmt@latest
if [ -x "$BIN_DIR/shfmt" ]; then
  echo "shfmt installed at $BIN_DIR/shfmt"
else
  echo "Failed to install shfmt" >&2
fi

# rust-analyzer
echo "Installing rust-analyzer..."
# Use latest-nightly style tag may change; pin if needed
case "${os}_${arch}" in
  linux_x86_64)
    ra_asset="rust-analyzer-x86_64-unknown-linux-gnu.gz" ;;
  linux_arm64)
    ra_asset="rust-analyzer-aarch64-unknown-linux-gnu.gz" ;;
  darwin_x86_64)
    ra_asset="rust-analyzer-x86_64-apple-darwin.gz" ;;
  darwin_arm64)
    ra_asset="rust-analyzer-aarch64-apple-darwin.gz" ;;
  *)
    echo "Unsupported platform for rust-analyzer: ${os}_${arch}" >&2
    ra_asset="" ;;
esac
if [ -n "$ra_asset" ]; then
  ra_tag="latest"
  ra_url="https://github.com/rust-lang/rust-analyzer/releases/download/${ra_tag}/${ra_asset}"
  curl -fsSL "$ra_url" | gunzip > "$BIN_DIR/rust-analyzer"
  chmod +x "$BIN_DIR/rust-analyzer"
fi

# jdtls
jdtls_version="1.50.0"
jdtls_stamp="202404261450"
jdtls_dir="jdt-language-server-${jdtls_version}-${jdtls_stamp}"
jdtls_url="https://download.eclipse.org/jdtls/milestones/${jdtls_version}/${jdtls_dir}.tar.gz"
echo "Installing jdtls..."
curl -fsSL "$jdtls_url" | tar -xz -C "$SHARE_DIR"
cat > "$BIN_DIR/jdtls" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
SHARE_DIR="$HOME/.local/share"
dir=$(fd -td -a "^jdt-language-server-" "$SHARE_DIR" 2>/dev/null | head -n1)
if [ -z "$dir" ]; then
  # Fallback to first matching directory
  dir=$(find "$SHARE_DIR" -maxdepth 1 -type d -name 'jdt-language-server-*' | head -n1)
fi
launcher=$(find "$dir/plugins" -name 'org.eclipse.equinox.launcher_*.jar' | head -n1)
exec java -jar "$launcher" "$@"
EOF
chmod +x "$BIN_DIR/jdtls"

echo "Installation complete. Add ~/.local/bin to PATH if not already."
