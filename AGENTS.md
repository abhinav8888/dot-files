# Agent Guidelines for Dotfiles Repository

## Build/Lint/Test Commands
- **Lint Python**: `ruff check .` (line length: 90, includes E, F, I, UP, RUF rules)
- **Format Python**: `ruff format .` (double quotes, isort with specific section ordering)
- **Type check Python**: Use configured language servers (ruff, pylsp, ty)
- **Shell scripts**: No specific linter configured, use shellcheck if available
- **Test single file**: No test framework detected - this is a configuration repository

## Code Style Guidelines

### Python
- **Line length**: 90 characters
- **Quotes**: Double quotes preferred
- **Imports**: Use isort with sections: future, standard-library, third-party, first-party, local-folder
- **Linting**: ruff with E, F, I, UP, RUF rules enabled
- **Formatting**: ruff formatter

### Shell Scripts
- **Error handling**: Use `set -e` for strict error checking
- **Package installation**: Check installation success and provide feedback
- **Arrays**: Use proper bash array syntax for package lists

### Configuration Files
- **TOML**: Use consistent formatting, group related settings
- **Lua**: Follow neovim/lua conventions, use local variables
- **Naming**: Use descriptive, lowercase names with underscores

### General
- **Tools**: ripgrep for searching, fd for finding files, fzf for fuzzy finding
- **Git**: Use lazygit for interactive git operations
- **File management**: GNU Stow for managing dotfile symlinks
- **No comments**: Avoid adding comments unless explicitly requested