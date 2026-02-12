# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration using **`vim.pack`** (Neovim's native package manager, not lazy.nvim). All Lua modules are namespaced under `fasaloft`.

## Architecture

**Load order** (`init.lua`): options → plugins → colorscheme → lsp → core

- `lua/fasaloft/options.lua` — Vim options and global keymaps (leader = space)
- `lua/fasaloft/plugins.lua` — Plugin declarations via `vim.pack.add()`
- `lua/fasaloft/colorscheme.lua` — Theme setup (vague.nvim, transparent)
- `lua/fasaloft/lsp.lua` — LSP enable calls and completion (blink.cmp, mason)
- `lua/fasaloft/core.lua` — Plugin-specific setup (oil, mini.pick, treesitter)
- `lsp/` — Native LSP server configs (`vim.lsp.Config` tables): `lua_ls`, `ts_ls`, `eslint`

## Key Conventions

- Plugins are added with `vim.pack.add({ "https://github.com/..." })` — no lazy.nvim spec tables
- LSP configs go in `lsp/<server_name>.lua` and return a `vim.lsp.Config` table; they are enabled via `vim.lsp.enable()` in `lsp.lua`
- LSP capabilities are extended with `blink.cmp` (see `lsp/lua_ls.lua` for pattern)
- Plugin lock file: `nvim-pack-lock.json`

## Key Mappings (leader = space)

- `<leader>lf` — LSP format
- `<leader>sv` — vertical split
- `<leader>e` — Oil file explorer
- `<leader>f` — mini.pick file finder
- `<leader>gg` — LazyGit
- `<C-h/j/k/l>` — Tmux-aware navigation
