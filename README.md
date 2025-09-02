# Dotfiles

A comprehensive collection of configuration files and scripts to set up a personalized development environment across multiple tools and applications.

## Overview

This repository contains dotfiles and configurations for various development tools, terminal applications, and shell environments. It uses [GNU Stow](https://www.gnu.org/software/stow/) for managing symbolic links to keep your home directory clean while maintaining organized configuration files.

### Project Structure
```
.
├── claude/           # Claude AI assistant configurations
├── config/           # XDG config directory structure
│   ├── aerospace/    # macOS window manager
│   ├── alacritty/    # Terminal emulator configs
│   ├── ghostty/      # Modern terminal emulator
│   ├── helix/        # Modal text editor
│   ├── lazygit/      # Git terminal UI
│   └── nvim/         # Neovim editor
├── starship/         # Shell prompt configurations
├── wezterm/          # WezTerm terminal emulator
├── zsh/              # Z shell configurations
├── bootstrap.sh      # Setup script
├── Brewfile          # Homebrew dependencies
├── .stow-global-ignore # Stow ignore patterns
└── README.md         # This file
```

## What's Included

### Terminal & Shell
- **Zsh**: Shell configuration with custom aliases, exports, and evals
- **Starship**: Cross-shell prompt with multiple theme variants
- **WezTerm**: Terminal emulator configuration with themes and keybindings
- **Alacritty**: GPU-accelerated terminal emulator with custom themes
- **Ghostty**: Modern terminal emulator configuration

### Development Tools
- **Neovim**: Text editor configuration with LazyVim setup
- **Helix**: Modal text editor configuration with themes
- **LazyGit**: Git terminal UI configuration

### Window Management
- **Aerospace**: macOS window manager configuration

### AI Assistant
- **Claude**: Configuration for Claude AI assistant with custom settings and debug scripts

### Themes
- Custom color schemes for various applications
- Multiple Starship prompt themes (default, pastel, tk variants)
- Terminal themes for WezTerm, Alacritty, and Ghostty

## Installation

### Prerequisites
- [GNU Stow](https://www.gnu.org/software/stow/) for managing symlinks
- [Homebrew](https://brew.sh/) (on macOS) - see included Brewfile for dependencies
- Git for version control
- Basic command line tools

### Dependencies (Brewfile)

The included `Brewfile` contains all necessary dependencies:
- Terminal emulators (WezTerm, Alacritty, Ghostty)
- Text editors (Neovim, Helix)
- Development tools (lazygit, aerospace)
- Shell utilities and tools

### Quick Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/dot-files.git ~/.dotfiles
   cd ~/.dotfiles

2. **Run the bootstrap script:**
   ```bash
   ./bootstrap.sh
   ```
   This script will:
   - Install GNU Stow if not present
   - Install dependencies from Brewfile
   - Set up initial directory structure
   - Configure basic environment variables

### Bootstrap Script Details

The `bootstrap.sh` script performs initial setup tasks:
- Checks for required dependencies
- Creates necessary directories
- Sets up basic configuration symlinks
- Provides status feedback during installation

### Manual Setup

If you prefer not to use GNU Stow, you can manually create symlinks:

```bash
# Example for Zsh configuration
ln -s ~/.dotfiles/zsh/.zsh ~/.zsh
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc

# Example for Neovim
ln -s ~/.dotfiles/config/.config/nvim ~/.config/nvim
```

## Configuration Details

### Zsh Setup

Add the following lines to your `~/.zshrc`:

```zsh
ZSH_CONFIG_DIR="$HOME/.zsh"
for config_file in $ZSH_CONFIG_DIR/*.zsh; do
  source $config_file
done
```

The Zsh configuration is split into modular files:
- `aliases.zsh`: Custom command aliases
- `evals.zsh`: Tool initializations and environment setup
- `export.zsh`: Environment variable exports

### Neovim

Uses LazyVim as the base configuration with custom plugins and settings. The configuration is located in `config/.config/nvim/`.

**Key features:**
- LazyVim plugin manager for efficient loading
- Custom keybindings and remaps
- Integrated LSP support
- Custom themes and appearance settings

### Starship

Multiple prompt themes are available in `starship/.config/`:
- `starship.toml`: Default theme with comprehensive modules
- `starship_pastel.toml`: Soft pastel color scheme
- `tk_starship.toml`: Modified Tokyo night theme


### WezTerm

Configuration includes:
- Custom keybindings for productivity
- Font settings with fallback chains
- Appearance preferences and window management
- Custom startup commands

### Terminal Emulators

**Alacritty:**
- GPU-accelerated rendering
- Custom themes in `config/.config/alacritty/themes/`
- Optimized for performance

**Ghostty:**
- Modern terminal with advanced features
- Custom configuration in `config/.config/ghostty/`

### Development Tools

**Helix:**
- Modal text editor configuration
- Custom theme in `config/.config/helix/themes/`
- Language server integrations

**LazyGit:**
- Git terminal UI with custom keybindings
- Enhanced git workflow shortcuts
- Custom color scheme integration

### Window Management

**Aerospace:**
- macOS window manager configuration
- Custom workspace layouts
- Keyboard-driven window management

### AI Assistant

**Claude:**
- Custom settings and preferences
- Environment-specific configurations

## Customization

### Adding New Configurations

1. Create a new directory for the tool: `mkdir newtool`
2. Add your configuration files: `newtool/.config/newtool/config`
3. Stow the new configuration: `stow newtool`

### Modifying Existing Configurations

Edit files directly in this repository. Changes will be reflected in your home directory


### Managing Conflicts

The `.stow-global-ignore` file helps manage which files to ignore during stowing:
- Prevents stowing of backup files
- Ignores system-specific files
- Excludes temporary files

## Backup and Restore

### Backup Existing Configurations

Before initial setup, backup your existing configurations:

```bash
# Example backup commands
cp ~/.zshrc ~/.zshrc.backup
cp ~/.config/nvim/init.lua ~/.config/nvim/init.lua.backup
```

### Restore from Backup

If needed, restore original configurations:

```bash
# Example restore commands
cp ~/.zshrc.backup ~/.zshrc
cp ~/.config/nvim/init.lua.backup ~/.config/nvim/init.lua
```

## Troubleshooting

### Common Issues

1. **Stow conflicts**: If stow reports conflicts, check for existing files
   ```bash
   # Check what would be stowed
   stow -n package_name
   # Remove conflicting files or backup them
   mv ~/.config/conflicting_file ~/.config/conflicting_file.backup
   ```

2. **Permission errors**: Ensure proper permissions on configuration files
   ```bash
   # Fix permissions
   chmod 644 ~/.zshrc
   chmod 755 ~/.config
   ```

3. **Theme not loading**: Verify theme file paths and syntax
   ```bash
   # Validate theme files
   cat ~/.config/starship/starship.toml
   # Check for syntax errors in terminal configs
   wezterm --config-file ~/.config/wezterm/wezterm.lua --validate
   ```

4. **Zsh configuration not loading**: Ensure ZSH_CONFIG_DIR is set correctly
   ```bash
   # Verify Zsh setup
   echo $ZSH_CONFIG_DIR
   ls -la ~/.zsh/
   ```

5. **Neovim plugins not working**: Clear cache and reinstall
   ```bash
   # Clear Neovim cache
   rm -rf ~/.local/share/nvim/
   rm -rf ~/.cache/nvim/
   ```

### Getting Help

- Check the [GNU Stow documentation](https://www.gnu.org/software/stow/manual/)
- Review individual tool documentation for configuration options
- Open an issue in this repository for setup-related problems
- Check the bootstrap script output for detailed error messages

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test your configurations
5. Submit a pull request

## Security Considerations

When managing dotfiles, keep these security practices in mind:

- **Never commit sensitive information**: Use `.gitignore` to exclude files containing passwords, API keys, or personal data
- **Review before committing**: Check for accidentally included secrets using tools like `git-secrets`
- **Use private repositories**: For configurations containing sensitive data
- **Environment variables**: Store sensitive values in environment variables rather than config files

