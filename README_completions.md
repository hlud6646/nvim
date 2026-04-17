# Neovim Completion & LSP Guide

This document outlines all completion features, keymaps, and LSP capabilities available in this Neovim configuration.

## Table of Contents
1. [General Completion (nvim-cmp)](#general-completion-nvim-cmp)
2. [Haskell-specific Features](#haskell-specific-features)
3. [LSP & Diagnostics](#lsp--diagnostics)
4. [Filetype-Specific Mappings](#filetype-specific-mappings)
5. [UI & Appearance](#ui--appearance)

---

## General Completion (nvim-cmp)

The primary completion engine is **nvim-cmp**, configured to work with Neovim's built-in LSP client.

### Triggering Completion
- **`<C-Space>`** – Open the completion menu (may not work in all terminals)
- **`<Tab>`** – When the completion menu is visible: navigate to next item; otherwise: insert a tab character
- **`<S-Tab>`** – Navigate to previous item in the completion menu
- **`<CR>` (Enter)** – Confirm the selected completion item

### Using Completions
1. **Start typing** – As you type, the completion menu will automatically appear with suggestions from various sources.
2. **Navigate** – Use `<Tab>` and `<S-Tab>` to move through the list of suggestions.
3. **Select** – Press `<CR>` to insert the selected completion.
4. **Cancel** – Press `<Esc>` to close the completion menu without selecting anything.

### Completion Sources
- **nvim_lsp** – Suggestions from the active Language Server Protocol (LSP) server
- **LuaSnip** – Snippet suggestions
- **Buffer** – Words from the current buffer
- **Path** – File paths

### Snippets with LuaSnip
Snippets are pre-defined code templates that can be expanded with placeholders.

#### Inserting Snippets
1. **From completion menu** – Type a snippet trigger word and select it from the completion menu.
2. **Expand manually** – Type the snippet trigger and press `<C-l>` (Control+l) to expand it immediately.

#### Navigating Within Snippets
Once a snippet is expanded:
- Use `<Tab>` to jump to the next placeholder
- Use `<S-Tab>` to jump to the previous placeholder
- Edit each placeholder as needed
- Press `<Esc>` to exit snippet navigation mode

#### Available Snippets
- **LSP snippets** – Provided by your language server
- **Pre-defined LuaSnip snippets** – For various programming languages
- **Custom snippets** – You can add your own in `~/.config/nvim/lua/snippets/`

### Note on `<C-Space>`
Many terminal emulators do not properly transmit `Control+Space` to Neovim. If `<C-Space>` doesn't open the completion menu, try:
1. Using `<Tab>` to navigate and trigger completion when suggestions appear automatically.
2. Configuring your terminal to send a distinct keycode for `Ctrl+Space`.
3. Using a Neovim GUI (like Neovide) which handles key combinations more reliably.

---

## Haskell-specific Features

### Language Server
- **Haskell Language Server (HLS)** via `haskell-tools.nvim`
- Formatting provider: **ormolu**
- Project checking enabled

### Keymaps (Haskell buffers)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>hs` | Normal | Hoogle signature search |
| `<leader>rr` | Normal | Toggle Haskell REPL |
| `<leader>ea` | Normal | Evaluate all (haskell-tools) |
| `<leader>pf` | Normal | Open project file (Cabal buffers) |
| `K` | Normal | Show hover information |
| `gd` | Normal | Go to definition |
| `<leader>ca` | Normal | Open code actions |
| `<leader>rn` | Normal | Rename symbol |
| `gl` | Normal | Show line diagnostic in floating window |
| `[d` | Normal | Go to previous diagnostic |
| `]d` | Normal | Go to next diagnostic |

### REPL Integration
- Toggle with `<leader>rr`
- Evaluate entire buffer with `<leader>ea`

---

## LSP & Diagnostics

### Diagnostic Display
- **Virtual text** with `●` prefix shown inline
- **Floating windows** for detailed diagnostic messages
- **Gutter signs** with custom icons:
  - Error: `󰅚 `
  - Warning: `󰀪 `
  - Hint: `󰌶 `
  - Info: `󰋽 `

### Diagnostic Navigation
- `gl` – Show diagnostic for current line (global and Haskell-specific)
- `[d` – Jump to previous diagnostic
- `]d` – Jump to next diagnostic

### LSP Handlers
- Hover windows and signature help have **rounded borders**
- Better visual presentation for LSP information

---

## Filetype-Specific Mappings

### Haskell (`*.hs`, `*.lhs`)
All Haskell-specific keymaps listed above apply.

### Cabal (`*.cabal`)
- `<leader>pf` – Open project file (via haskell-tools)

### Other Filetypes
- General LSP features work for any language with an attached LSP server
- Treesitter provides syntax highlighting for: **haskell**, **cabal**, **lua**

---

## UI & Appearance

### Status Line
- **vim-airline** with Kanagawa theme
- Global status line (`laststatus=3`)
- Tabline enabled for buffer navigation

### Colorscheme
- **Kanagawa Wave** – Dark theme with subtle colors

### Buffer Management
- `<Tab>` – Next buffer
- `<S-Tab>` – Previous buffer
- `<Del>` – Delete current buffer

### Window Splitting
- `splitright` and `splitbelow` enabled for natural splitting
- Clean end-of-buffer display (no `~` symbols)

---

## Getting Started

### Prerequisites
1. Neovim (≥ 0.9)
2. Git (for plugin management)
3. Language servers for your desired languages (e.g., `haskell-language-server` for Haskell)

### Installation
Plugins are managed via **lazy.nvim** and will install automatically when you start Neovim.

### Adding New Languages
1. Install the corresponding LSP server (e.g., `lua-language-server` for Lua)
2. Ensure the server is in your PATH
3. The LSP client will attach automatically for supported filetypes

---

## Troubleshooting

### Completion Not Working
- Verify LSP server is installed and running
- Check `:LspInfo` for active clients
- Ensure filetype is correctly set (`:set ft?`)

### Haskell Features Missing
- Confirm `haskell-tools.nvim` is loaded (`:checkhealth haskell-tools`)
- Verify `haskell-language-server` is installed

### Diagnostic Icons Not Appearing
- Ensure your terminal supports Nerd Font icons
- Install a patched font (e.g., FiraCode Nerd Font)

---

## Further Resources
- [nvim-cmp documentation](https://github.com/hrsh7th/nvim-cmp)
- [haskell-tools.nvim](https://github.com/mrcjkb/haskell-tools.nvim)
- [Neovim LSP config](https://github.com/neovim/nvim-lspconfig)

---
*Last updated: 2026-03-13*
