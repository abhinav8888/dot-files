# Tmux Quick Reference

## TLDR - Essential Commands

| Action | Command |
|--------|---------|
| **New session** | `tmux` or `tmux new -s name` |
| **Attach session** | `tmux a` or `tmux a -t name` |
| **New window** | `Ctrl-b c` |
| **Rename window** | `Ctrl-b ,` |
| **Rename session** | `Ctrl-b $` |
| **Horizontal split** | `Ctrl-b \|` |
| **Vertical split** | `Ctrl-b -` |
| **Switch pane** | `Ctrl-b` + arrow or `Ctrl-b o` |
| **Switch window** | `Ctrl-b n/p` or `Ctrl-b 0-9` |
| **Switch session** | `Ctrl-b s` |
| **Detach** | `Ctrl-b d` |
| **Reload config** | `Ctrl-b r` |

## Detailed Guide

This guide covers essential tmux operations using your custom configuration.

### Sessions

#### Create Session
- **Default session**: `tmux`
- **Named session**: `tmux new -s session_name`

#### Attach to Session
- **Default/only session**: `tmux a`
- **Named session**: `tmux a -t session_name`
- **List sessions**: `tmux ls`

#### Rename Session
- **Inside tmux**: `Ctrl-b $` then enter new name

### Windows

#### Create Window
- **New window**: `Ctrl-b c`

#### Rename Window
- **Rename current window**: `Ctrl-b ,` then enter new name

#### Switch Windows
- **Next window**: `Ctrl-b n`
- **Previous window**: `Ctrl-b p`
- **Window by number**: `Ctrl-b 0-9`
- **Window list**: `Ctrl-b w`

### Panes

#### Create Panes
- **Horizontal split** (side-by-side): `Ctrl-b |`
- **Vertical split** (top-bottom): `Ctrl-b -`

#### Switch Panes
- **Next pane**: `Ctrl-b o`
- **Navigate with arrow keys**: `Ctrl-b` + arrow key
- **Pane by number**: `Ctrl-b q` then number

### Sessions Management

#### Switch Sessions
- **Session list**: `Ctrl-b s`
- **Detach from session**: `Ctrl-b d`

## Configuration Features

### Custom Keybindings
- `Ctrl-b |` - Horizontal split
- `Ctrl-b -` - Vertical split
- `Ctrl-b r` - Reload configuration

### Mouse Support
Mouse is enabled for:
- Selecting panes
- Resizing panes
- Selecting windows

### Styling
- Catppuccin-inspired color scheme
- Status bar at top with date/time
- Custom pane borders and active pane highlighting