# Zellij Quick Reference

## TLDR - Essential Commands

| Action | Command |
|--------|---------|
| **New session** | `zellij` or `zellij --session name` |
| **Attach session** | `zellij attach` or `zellij attach name` |
| **New tab** | `Ctrl t` then `n` |
| **Rename tab** | `Ctrl t` then `r` |
| **Rename session** | `Ctrl o` then `w` (session manager) |
| **New pane (vertical)** | `Ctrl p` then `r` |
| **New pane (horizontal)** | `Ctrl p` then `d` |
| **Switch pane** | `Ctrl p` then `h/j/k/l` or `Alt` + arrow |
| **Switch tab** | `Ctrl t` then `h/l` or `Alt i/o` |
| **Switch session** | `Ctrl o` then `w` (session manager) |
| **Detach** | `Ctrl o` then `d` |
| **Quit** | `Ctrl q` |

## Detailed Guide

This guide covers essential zellij operations using the default keybindings.

### Sessions

#### Create Session
- **Default session**: `zellij`
- **Named session**: `zellij --session session_name`
- **Layout session**: `zellij --layout layout_name`

#### Attach to Session
- **Default/only session**: `zellij attach`
- **Named session**: `zellij attach session_name`
- **List sessions**: `zellij list-sessions`

#### Session Management
- **Detach from session**: `Ctrl o` then `d`
- **Session manager**: `Ctrl o` then `w`

### Tabs

#### Create Tab
- **New tab**: `Ctrl t` then `n`

#### Rename Tab
- **Rename current tab**: `Ctrl t` then `r`, type name, Enter

#### Switch Tabs
- **Next tab**: `Ctrl t` then `l` or `Alt o`
- **Previous tab**: `Ctrl t` then `h` or `Alt i`
- **Tab by number**: `Ctrl t` then `1-9`
- **Last tab**: `Ctrl t` then `Tab`

#### Tab Operations
- **Close tab**: `Ctrl t` then `x`
- **Move tab left**: `Alt i`
- **Move tab right**: `Alt o`
- **Break pane to new tab**: `Ctrl t` then `b`

### Panes

#### Create Panes
- **New pane (down)**: `Ctrl p` then `d`
- **New pane (right)**: `Ctrl p` then `r`
- **New pane (stacked)**: `Ctrl p` then `s`
- **New floating pane**: `Alt n`

#### Switch Panes
- **Move focus**: `Ctrl p` then `h/j/k/l` (vim keys)
- **Move focus**: `Alt` + arrow keys
- **Next pane**: `Ctrl p` then `p`
- **Last pane**: `Ctrl p` then `p` (again)

#### Pane Operations
- **Close pane**: `Ctrl p` then `x`
- **Toggle fullscreen**: `Ctrl p` then `f`
- **Toggle floating**: `Ctrl p` then `w` or `Alt f`
- **Rename pane**: `Ctrl p` then `c`
- **Toggle pane frames**: `Ctrl p` then `z`
- **Move pane**: `Ctrl h` then direction keys

### Layouts and Resizing

#### Resize Panes
- **Enter resize mode**: `Ctrl n`
- **Resize**: `h/j/k/l` (vim keys) or arrow keys
- **Increase size**: `=`
- **Decrease size**: `-`
- **Exit resize mode**: `Ctrl n` or `Enter`

#### Layout Operations
- **Next layout**: `Alt ]`
- **Previous layout**: `Alt [`
- **Swap layout**: `Space` (in tmux mode)

### Scrolling and Search

#### Scroll Mode
- **Enter scroll mode**: `Ctrl s`
- **Scroll up/down**: `k/j` or arrow keys
- **Page up/down**: `Ctrl b/Ctrl f`
- **Half page**: `u/d`
- **Search**: `Ctrl s` then `s`
- **Exit scroll mode**: `Ctrl s` or `Enter`

#### Search Operations
- **Next match**: `n`
- **Previous match**: `p`
- **Toggle case sensitivity**: `c`
- **Toggle whole word**: `o`
- **Toggle wrap**: `w`

### Modes

#### Available Modes
- **Normal**: Default mode for general operations
- **Pane**: `Ctrl p` - Pane management
- **Tab**: `Ctrl t` - Tab management
- **Resize**: `Ctrl n` - Pane resizing
- **Scroll**: `Ctrl s` - Scrolling through output
- **Session**: `Ctrl o` - Session management
- **Move**: `Ctrl h` - Move panes between tabs
- **Locked**: `Ctrl g` - Lock interface

#### Mode Navigation
- **Switch to mode**: Use the mode keybinding (e.g., `Ctrl p` for pane mode)
- **Exit mode**: `Enter`, `Esc`, or the mode's exit keybinding
- **Lock interface**: `Ctrl g`
- **Unlock interface**: `Ctrl g` (in locked mode)

### Plugins and Features

#### Built-in Plugins
- **Session Manager**: `Ctrl o` then `w`
- **Configuration**: `Ctrl o` then `c`
- **Plugin Manager**: `Ctrl o` then `p`
- **About**: `Ctrl o` then `a`

#### Additional Features
- **Floating panes**: Toggle with `Alt f` or `Ctrl p` then `w`
- **Pane grouping**: `Alt p` to toggle, `Alt Shift p` to mark
- **Sync tab**: `Ctrl t` then `s` (sync input to all panes)
- **Edit scrollback**: `Ctrl s` then `e`

### Configuration Features

#### Default Keybindings
- `Ctrl p` - Enter pane mode
- `Ctrl t` - Enter tab mode
- `Ctrl n` - Enter resize mode
- `Ctrl s` - Enter scroll mode
- `Ctrl o` - Enter session mode
- `Ctrl h` - Enter move mode
- `Ctrl g` - Lock/unlock interface
- `Ctrl q` - Quit zellij

#### Mouse Support
Mouse is enabled by default for:
- Selecting panes
- Resizing panes
- Selecting tabs
- Scrolling

#### Layout System
- **Auto layout**: Automatically arranges panes
- **Custom layouts**: Define layouts in KDL format
- **Layout directory**: Store custom layouts in `~/.config/zellij/layouts/`

### Advanced Usage

#### Command Line Options
- `zellij --help` - Show all options
- `zellij --layout compact` - Start with compact layout
- `zellij --config path/to/config.kdl` - Use custom config
- `zellij list-sessions` - List all sessions
- `zellij kill-session name` - Kill a session

#### Configuration File
Located at `~/.config/zellij/config.kdl`
- Define custom keybindings
- Set themes and colors
- Configure plugins
- Set default options

#### Session Serialization
- Sessions can be serialized and resurrected
- Useful for persisting terminal state
- Configure with `session_serialization` option

### Tips and Tricks

#### Productivity Tips
- Use layouts to quickly set up your workspace
- Leverage floating panes for temporary tasks
- Use pane groups for related operations
- Take advantage of the session manager for organization

#### Common Workflows
- **Development**: Main editor + terminal + logs
- **Monitoring**: Multiple log tails in different panes
- **Testing**: Run tests in one pane, monitor in others
- **Pair programming**: Share sessions via web interface

#### Performance
- Zellij is written in Rust for optimal performance
- Minimal resource usage compared to other multiplexers
- Efficient pane management and rendering