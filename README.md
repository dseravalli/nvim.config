# Neovim Configuration

## Prerequisites

### Required

- [Neovim 0.12+](https://github.com/neovim/neovim/releases)
- git
- [Ripgrep](https://github.com/BurntSushi/ripgrep) (`rg`)
- A [Nerd Font](https://www.nerdfonts.com/)
- C compiler (`gcc` or `clang`), `make`, [`tree-sitter` CLI](https://github.com/tree-sitter/tree-sitter/releases) -- for Treesitter parser compilation

### Optional

- Node + npm
- [lazygit](https://github.com/jesseduffield/lazygit)
- tmux

### Language Runtimes (as needed)

Mason handles LSP servers, formatters, and linters -- but the underlying runtimes must be present.

- Go
- Python (python3 or uv)
- Ruby
- Node.js

## Installation

```bash
git clone https://github.com/dseravalli/nvim.config ~/.config/nvim
```


1. Open Neovim: `nvim`
2. [lazy.nvim](https://github.com/folke/lazy.nvim) will automatically install all plugins
3. [Mason](https://github.com/williamboman/mason.nvim) will install configured LSP servers, formatters, linters, and debug adapters
4. Treesitter will compile and install language parsers (requires C compiler, make, and tree-sitter CLI)
5. Run `:checkhealth` to verify everything is working
