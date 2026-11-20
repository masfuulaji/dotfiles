# Zellij Configuration for Neovim

A modal, conflict-free Zellij configuration designed specifically for Neovim users.

- **Theme**: Tokyo Night Storm (matches Alacritty `#24283b` and LazyVim)
- **Base Mode**: `locked` (all keystrokes pass directly to Neovim)
- **Leader Key**: `Ctrl + a`
- **Auto-Lock**: Any triggered action immediately returns Zellij to `locked` mode so focus returns straight back to Neovim.
- **Scrollback Editor**: Neovim in WSL with ANSI color preservation.

---

## How It Works

1. Zellij stays in **Locked** mode during normal editing. Neovim receives 100% of your keystrokes (`Ctrl + p`, `Ctrl + w`, `Ctrl + h/j/k/l`, etc.).
2. Press `Ctrl + a` to activate the leader mode.
3. Press any shortcut below to perform an action.
4. Zellij executes the command and automatically returns to **Locked** mode.

---

## Keybindings Reference

### Leader & Passthrough
| Key | Action |
| :--- | :--- |
| `Ctrl + a` then `Ctrl + a` | Send literal `Ctrl + a` to Neovim (e.g. increment number) |
| `Ctrl + a` then `Esc` / `q` / `Ctrl + c` | Cancel leader and return to Neovim |

### Pane Focus (hjkl / Arrows)
| Key | Action |
| :--- | :--- |
| `Ctrl + a` then `h` / `Left` | Focus pane to the left |
| `Ctrl + a` then `j` / `Down` | Focus pane below |
| `Ctrl + a` then `k` / `Up` | Focus pane above |
| `Ctrl + a` then `l` / `Right` | Focus pane to the right |

### Moving Panes
| Key | Action |
| :--- | :--- |
| `Ctrl + a` then `Shift + h` (or `H`) | Move focused pane left |
| `Ctrl + a` then `Shift + j` (or `J`) | Move focused pane down |
| `Ctrl + a` then `Shift + k` (or `K`) | Move focused pane up |
| `Ctrl + a` then `Shift + l` (or `L`) | Move focused pane right |

### Splits & Pane Management
| Key | Action |
| :--- | :--- |
| `Ctrl + a` then `v` / `%` | Vertical split (new pane to the right) |
| `Ctrl + a` then `s` / `"` | Horizontal split (new pane below) |
| `Ctrl + a` then `n` | Create stacked pane |
| `Ctrl + a` then `o` | Create new auto-layout pane |
| `Ctrl + a` then `x` | Close focused pane |
| `Ctrl + a` then `z` | Zoom / Fullscreen toggle |
| `Ctrl + a` then `.` | Toggle floating pane |
| `Ctrl + a` then `>` | Toggle pane embed or floating |
| `Ctrl + a` then `g` | Next swap layout |
| `Ctrl + a` then `Shift + r` | Rename pane (press `Enter` to confirm, `Esc` to cancel) |
| `Ctrl + a` then `Ctrl + r` | Enter continuous Resize mode |

### Tab Management
| Key | Action |
| :--- | :--- |
| `Ctrl + a` then `a` | Toggle between current and last active tab |
| `Ctrl + a` then `t` | Create new tab |
| `Ctrl + a` then `1` to `9` | Jump directly to tab 1 through 9 |
| `Ctrl + a` then `r` | Rename tab (press `Enter` to confirm, `Esc` to cancel) |
| `Ctrl + a` then `Shift + x` | Close active tab |
| `Ctrl + a` then `Ctrl + t` | Enter continuous Tab mode |

### Buffer, Scrollback & Search
| Key | Action |
| :--- | :--- |
| `Ctrl + a` then `f` / `e` | Open terminal scrollback in Neovim (with ANSI colors) |
| `Ctrl + a` then `d` / `Ctrl + d` / `[` | Enter Scroll mode |
| `Ctrl + a` then `/` | Search terminal scrollback |
| `Ctrl + a` then `Ctrl + l` | Clear terminal buffer |

### Session & Plugins
| Key | Action |
| :--- | :--- |
| `Ctrl + a` then `w` | Open floating Session Manager |
| `Ctrl + a` then `p` | Open floating Plugin Manager |

---

## Sub-Modes

When entering a continuous sub-mode, you can perform multiple actions repeatedly. Press `Esc`, `q`, `Enter`, or `Ctrl + a` when finished to return to Neovim.

### Resize Mode (`Ctrl + a` then `Ctrl + r`)
* `h` / `Left` : Increase width left
* `j` / `Down` : Increase height down
* `k` / `Up` : Increase height up
* `l` / `Right` : Increase width right
* `H` : Decrease width left
* `J` : Decrease height down
* `K` : Decrease height up
* `L` : Decrease width right
* `+` / `=` : Increase size proportionally
* `-` : Decrease size proportionally
* `Esc` / `Enter` / `q` : Exit back to Neovim

### Tab Mode (`Ctrl + a` then `Ctrl + t`)
* `h` / `Left` / `k` / `Up` : Go to previous tab
* `l` / `Right` / `j` / `Down` : Go to next tab
* `Shift + h` : Move tab left
* `Shift + l` : Move tab right
* `t` / `n` : New tab
* `x` : Close tab
* `r` : Rename tab
* `s` : Toggle synchronized input across all panes in tab
* `1` to `9` : Jump to tab
* `Esc` / `Enter` / `q` : Exit back to Neovim

### Scroll Mode (`Ctrl + a` then `d` or `[`)
* `j` / `Ctrl + e` / `Down` : Scroll down 1 line
* `k` / `Ctrl + y` / `Up` : Scroll up 1 line
* `Ctrl + d` / `d` : Half page scroll down
* `Ctrl + u` / `u` : Half page scroll up
* `Ctrl + f` / `PageDown` : Full page scroll down
* `Ctrl + b` / `PageUp` : Full page scroll up
* `g` : Jump to top of buffer
* `G` : Jump to bottom of buffer
* `/` : Search buffer
* `f` / `e` / `s` : Open scrollback in Neovim
* `q` / `Esc` : Exit back to Neovim

### Search Mode (`Ctrl + a` then `/`)
* Type search query, press `Enter` to search
* `n` : Jump to next match (up)
* `N` : Jump to previous match (down)
* `c` : Toggle case sensitivity
* `w` : Toggle wrap search
* `o` : Toggle whole word search
* `q` / `Esc` : Exit back to Neovim
