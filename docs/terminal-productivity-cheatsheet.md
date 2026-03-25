# Terminal Productivity Cheatsheet

---

## Oh My Zsh

**Config:** `~/.zshrc`

| What | How |
|------|-----|
| Change theme | `ZSH_THEME="agnoster"` in `.zshrc` |
| Enable plugins | `plugins=(git docker kubectl z fzf)` in `.zshrc` |
| Reload config | `source ~/.zshrc` or `omz reload` |
| Update | `omz update` |
| List themes | `ls ~/.oh-my-zsh/themes/` |
| List plugins | `ls ~/.oh-my-zsh/plugins/` |

**Must-have plugins:** `git`, `z`, `fzf`, `docker`, `kubectl`, `history`, `sudo` (press `Esc` twice to prepend sudo)

---

## Starship (Cross-shell Prompt)

**Config:** `~/.config/starship.toml`

| What | How |
|------|-----|
| Install | `curl -sS https://starship.rs/install.sh \| sh` |
| Enable in zsh | Add `eval "$(starship init zsh)"` to `.zshrc` |
| Use a preset | `starship preset nerd-font-symbols -o ~/.config/starship.toml` |
| Available presets | `starship preset --list` |

**Tip:** Starship shows git status, language versions, and command duration automatically.

---

## Helix (Modal Text Editor)

**Config:** `~/.config/helix/config.toml`

| What | How |
|------|-----|
| Open file | `hx filename` |
| File picker | `Space + f` |
| Global search | `Space + /` |
| Command palette | `:` |
| Buffer picker | `Space + b` |
| Split vertical | `Space + v` |
| Split horizontal | `Space + s` |
| Save | `:w` |
| Quit | `:q` |
| Go to definition | `gd` |
| Find references | `gr` |
| Rename symbol | `Space + r` |
| Code actions | `Space + a` |
| Toggle comment | `Ctrl + c` |
| Select line | `x` |
| Multi-cursor | `C` (copy cursor down), `Alt + c` (copy cursor up) |
| Search in file | `/pattern` |

**Tip:** Helix has built-in LSP support — no plugin manager needed.

### Helix — Additional Tips

**Bemol integration (for Amazon Brazil builds):**

```
bemol --watch
bb proxy
```

**LSP health check:** `hx --health go` (or any language)

**Built-in tutor:** `:tutor` inside Helix

**Navigation basics:**

```
h/j/k/l     — left/down/up/right
w/e/b       — word forward/end/backward (W/E/B for WORDS)
f/F         — find char forward/backward (inclusive)
t/T         — find char forward/backward (exclusive)
```

**Selection & editing:**

```
x           — select entire line (repeat for more)
d           — delete selection
c           — delete selection + enter insert mode
wd          — delete word forward
u / U       — undo / redo
y / p       — yank / paste
Space+Y/P   — system clipboard yank/paste
~           — toggle case
Q           — record/stop macro, q — replay macro
;           — collapse selection
```

**Jumplist:**

```
Ctrl+s      — save position to jumplist
Ctrl+i/o    — forward/backward in jumplist
```

**Search:**

```
/           — search forward
?           — search backward
n / N       — next / previous match
s           — select regex matches within selection
```

**Useful links:**

- Vim migration: https://github.com/helix-editor/helix/wiki/Migrating-from-Vim
- Getting started: https://github.com/helix-editor/helix/wiki/1.-Tutorial:-Getting-Started
- Language servers: https://github.com/helix-editor/helix/wiki/Language-Server-Configurations

---

## Zoxide (Smarter `cd`)

| What | How |
|------|-----|
| Install | `curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh \| sh` |
| Enable in zsh | Add `eval "$(zoxide init zsh)"` to `.zshrc` |
| Jump to dir | `z project` (fuzzy matches most-visited dirs) |
| Interactive pick | `zi` |
| Jump with multiple keywords | `z foo bar` (matches path containing both) |
| List ranked dirs | `zoxide query -ls` |
| Remove a path | `zoxide remove /old/path` |

**Tip:** The more you visit a directory, the higher it ranks. `z` learns your habits.

---

## Fzf (Fuzzy Finder)

| What | How |
|------|-----|
| Search files | `fzf` |
| Preview files | `fzf --preview 'cat {}'` |
| Reverse history search | `Ctrl + R` (with fzf plugin) |
| Change directory | `Alt + C` |
| Insert file path | `Ctrl + T` |
| Pipe anything | `cat log.txt \| fzf` |
| Kill a process | `kill -9 $(ps aux \| fzf \| awk '{print $2}')` |
| Git branch switch | `git branch \| fzf \| xargs git checkout` |
| Open in editor | `hx $(fzf)` |

**Tip:** Combine fzf with ripgrep: `rg --files \| fzf`

---

## Ripgrep (`rg` — Faster grep)

| What | How |
|------|-----|
| Search text | `rg "pattern"` |
| Case insensitive | `rg -i "pattern"` |
| File type filter | `rg "TODO" -t py` |
| Show context | `rg -C 3 "error"` (3 lines around match) |
| Only filenames | `rg -l "pattern"` |
| Count matches | `rg -c "pattern"` |
| Exclude dirs | `rg "pattern" -g '!node_modules'` |
| Regex search | `rg "fn\s+\w+"` |
| Search hidden files | `rg --hidden "pattern"` |
| Replace (preview) | `rg "old" -r "new"` |

**Tip:** ripgrep respects `.gitignore` by default — no junk results.

---

## LazyGit (Git TUI)

**Site:** https://github.com/jesseduffield/lazygit

| What | How |
|------|-----|
| Install (mac) | `brew install lazygit` |
| Install (DevDesktop) | See Copr repo: `sudo yum install lazygit` |
| Launch | `lazygit` or alias `lg` |
| Move up/down | `j` / `k` or arrow keys |
| Switch panels | `Tab` / `Shift+Tab` |
| Stage/unstage file or hunk | `Space` |
| Commit | `c` |
| Push / Pull / Fetch | `p` / `P` / `f` |
| Merge / Rebase | `m` / `r` |
| Cherry-pick | `Shift+c` to copy, `Shift+v` to paste |
| Stage individual lines | Select hunk → `Space` |
| View keymaps | `?` |
| Drill into item | `Enter` |
| Go back / close | `Esc` / `q` |

---

## k9s (Kubernetes TUI)

| What | How |
|------|-----|
| Launch | `k9s` |
| Switch namespace | `:ns` then select |
| View pods | `:pods` |
| View deployments | `:deploy` |
| View services | `:svc` |
| View logs | Select pod → `l` |
| Shell into pod | Select pod → `s` |
| Describe resource | Select → `d` |
| Delete resource | Select → `Ctrl + d` |
| Filter | `/search-term` |
| Port forward | Select pod → `Shift + f` |
| Switch context | `:ctx` |
| View events | `:events` |
| YAML view | Select → `y` |
| Quit | `:q` or `Ctrl + c` |

**Tip:** Use `:xray deploy` to see a tree view of deployments → replicasets → pods.

---

## Ghostty (Modern Terminal Emulator)

**Site:** https://ghostty.org/
**Config:** `~/.config/ghostty/`

Ghostty is a fast, feature-rich, cross-platform terminal emulator with platform-native UI and GPU acceleration.

---

## Navi (Interactive Cheatsheet)

**Site:** https://github.com/denisidoro/navi

An interactive cheatsheet tool for the command-line. Browse through cheatsheets and execute commands with dynamically suggested argument values.

| What | How |
|------|-----|
| Launch | `navi` |
| Custom config | https://github.com/denisidoro/navi/blob/master/docs/configuration/README.md |

---

## LSD (Modern `ls`)

**Site:** https://github.com/lsd-rs/lsd

| What | How |
|------|-----|
| Install (mac) | `brew install lsd` |
| Install (DevDesktop) | `cargo install lsd` |
| Config | `~/.config/lsd/config.yaml` |
| Colors | `~/.config/lsd/colors.yaml` |

Reference: https://blog.meain.io/2022/your-terminal-on-lsd/

---

## Additional Useful Tools (from Brewfile)

| Tool | What it does |
|------|-------------|
| `bat` | `cat` with syntax highlighting and git integration |
| `fd` | Faster, user-friendly alternative to `find` |
| `delta` | Better git diffs with syntax highlighting |
| `glow` | Render markdown in the terminal |
| `hyperfine` | Command-line benchmarking tool |
| `tmux` | Terminal multiplexer for session management |
| `ast-grep` | Structural code search and rewrite |
| `tree-sitter` | Incremental parsing for syntax highlighting |
| `oh-my-posh` | Cross-shell prompt theme engine |
| `stow` | Symlink manager for dotfiles |

---

## Power Combos

```bash
# Fuzzy search code and open in helix
rg -l "pattern" | fzf --preview 'rg --color=always "pattern" {}' | xargs hx

# Jump to project and start editing
z myproject && hx .

# Interactive git log
git log --oneline | fzf --preview 'git show {1}' | awk '{print $1}' | xargs git show

# Find and kill process interactively
ps aux | fzf | awk '{print $2}' | xargs kill -9

# Search env vars
env | fzf

# Quick file preview
fzf --preview 'head -50 {}'
```

---

## Quick Install Summary

```bash
# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Starship
curl -sS https://starship.rs/install.sh | sh

# Helix
sudo apt install helix  # or: brew install helix

# Zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# Fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

# Ripgrep
sudo apt install ripgrep  # or: brew install ripgrep

# k9s
brew install derailed/k9s/k9s  # or: sudo snap install k9s
```

---

## Recommended Aliases

```bash
alias vim="nvim"
alias grep=rg
alias lg='lazygit'
alias tnstar='cp ~/.config/tk_starship.toml ~/.config/starship.toml'
alias ptstar='cp ~/.config/starship_pastel.toml ~/.config/starship.toml'
```

---

## Recommended Shell Init

```bash
eval "$(zoxide init zsh)"
source <(fzf --zsh)

# oh-my-posh for supported terminals (Ghostty, WezTerm, Alacritty)
local _omp_terminals=(ghostty WezTerm alacritty)
if (( ${_omp_terminals[(Ie)$TERM_PROGRAM]} )); then
  eval "$(oh-my-posh init zsh --config '~/.config/themes/amro.yaml')"
fi
```

---

## Dotfiles Management with GNU Stow

Use [GNU Stow](https://www.gnu.org/software/stow/) to manage configs as symlinks:

```bash
# Clone your dotfiles
git clone <your-repo> ~/.dotfiles && cd ~/.dotfiles

# Stow a config package (e.g. zsh)
stow zsh        # creates ~/.zsh → ~/.dotfiles/zsh/.zsh

# Stow helix config
stow config     # creates ~/.config/helix → ~/.dotfiles/config/.config/helix

# Preview without applying
stow -n package_name
```
