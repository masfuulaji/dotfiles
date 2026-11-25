# 💤 LazyVim Configuration

Customized [LazyVim](https://www.lazyvim.org) setup themed with **Tokyo Night (Transparent)**, featuring seamless Zellij split navigation, right-docked file explorer, Git Diffview, Go debugging (DAP), and multi-language LSP support.

---

## ✨ Features & Included Plugins

* **Theme**: [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) (`night` style) with full background transparency for editor buffers, sidebars, and floating windows.
* **Right-Docked Explorer**: File explorer (Snacks.nvim) configured to open on the **right side** of the screen.
* **Zellij Seamless Navigation**: Built-in split navigator in `keymaps.lua` enables moving smoothly across Neovim splits and Zellij terminal multiplexer panes using standard `Ctrl+h/j/k/l`.
* **Git Diffview**: [diffview.nvim](https://github.com/sindrets/diffview.nvim) for dedicated side-by-side Git diffs and branch file history.
* **DAP Debugging**: Built-in `nvim-dap` with Go / Delve support and automatic `.vscode/launch.json` loader.
* **Vim Discipline**: [hardtime.nvim](https://github.com/m4xshen/hardtime.nvim) to break bad navigation habits (like repeated `jjjj` or `llll`).
* **Languages & Tooling**: Configured extras for **Go**, **TypeScript**, **Vue**, **Docker**, and **JSON**.
* **Formatting**: Global auto-format on save is set to manual (`vim.g.autoformat = false`), format on demand via `<leader>cf`.

---

## ⌨️ Keybindings Cheatsheet

### 🧭 Navigation & Splits
| Keybinding | Context | Action |
| :--- | :--- | :--- |
| `Ctrl + h` | Neovim | Navigate to left split (or left Zellij pane at boundary) |
| `Ctrl + j` | Neovim | Navigate to split below (or bottom Zellij pane at boundary) |
| `Ctrl + k` | Neovim | Navigate to split above (or top Zellij pane at boundary) |
| `Ctrl + l` | Neovim | Navigate to right split (or right Zellij pane at boundary) |
| `Ctrl + a` then `h/j/k/l` | Zellij Pane | Move focus between Zellij panes (back into Neovim) |
| `<leader>e` / `<leader>fe` | Neovim | Toggle File Explorer (docked on **right**) |
| `<leader>fE` | Neovim | Toggle File Explorer in current working directory |
| `<C-w>s` / `<C-w>v` | Neovim | Split window horizontally / vertically |
| `<C-w>q` | Neovim | Close current split |

### 🔍 Find & Search (Snacks Picker)
| Keybinding | Action |
| :--- | :--- |
| `<leader><space>` | Find Files (root dir) |
| `<leader>ff` | Find Files (root dir) |
| `<leader>sg` | Live Grep across project |
| `<leader>sb` | Grep current buffer |
| `<leader>fb` | Switch Open Buffer |
| `<leader>fr` | Recent files |

### 🌿 Git & Diffview
| Keybinding | Action |
| :--- | :--- |
| `<leader>gd` | **Toggle Diffview** (open / close full Git diff) |
| `<leader>gD` | **Diffview File History** (current file) |
| `<leader>gD` *(visual)* | **Diffview File History** (selected line range) |
| `<leader>gg` | Open Lazygit |
| `<leader>gb` | Git blame line |

### 🐞 Debugging (DAP)
| Keybinding | Action |
| :--- | :--- |
| `<leader>db` | Toggle Breakpoint |
| `<leader>dc` | Start / Continue Debugger |
| `<leader>di` | Step Into |
| `<leader>do` | Step Over |
| `<leader>dO` | Step Out |
| `<leader>du` | Toggle Debugger UI |
| `<leader>dt` | Terminate Debugging Session |

### 🛠️ Code & Diagnostics
| Keybinding | Action |
| :--- | :--- |
| `<leader>cf` | Format current buffer |
| `<leader>ca` | Code Actions |
| `<leader>cr` | Rename symbol |
| `gd` | Go to definition |
| `gr` | Go to references |
| `K` | Hover symbol documentation |
| `[d` / `]d` | Jump to previous / next diagnostic |
| `<leader>xx` | Toggle Trouble diagnostics panel |

---

## 📁 Directory Structure

```text
nvim/
├── init.lua                   # Entry point, boots lazy.nvim
├── lazyvim.json               # Enabled LazyVim extras (Go, TS, Vue, Docker, DAP)
├── lazy-lock.json             # Pinned plugin lockfile
└── lua/
    ├── config/
    │   ├── autocmds.lua       # Custom autocommands
    │   ├── keymaps.lua        # Seamless Zellij navigation & custom keymaps
    │   ├── lazy.lua           # Lazy.nvim plugin manager configuration
    │   └── options.lua        # Editor options (vim.opt, autoformat = false)
    └── plugins/
        ├── colorscheme.lua    # Tokyo Night (transparent background)
        ├── dap.lua            # DAP Delve / vscode launch.json support
        ├── diffview.lua       # Diffview git diff & history
        ├── explorer.lua       # Right-docked explorer layout (Snacks)
        └── hardtime.lua       # Hardtime discipline helper
```

---

## 🚀 Setup & Requirements

### Prerequisites
* **Neovim** >= 0.10.0
* **Git**
* A **Nerd Font** (recommended: *JetBrainsMono Nerd Font*)
* **ripgrep** & **fd** (for fast fuzzy searching)

### Linking to Your System
From the dotfiles root directory, run:

**Windows (PowerShell):**
```powershell
.\install.ps1
```
*(Creates an NTFS junction at `$env:LOCALAPPDATA\nvim` pointing to `dotfiles/nvim`).*

**Linux / WSL (Bash):**
```bash
./install.sh
```
*(Creates a symlink at `~/.config/nvim` pointing to `dotfiles/nvim`).*
