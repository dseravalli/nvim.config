# Neovim Configuration

## Installation

1. **Prerequisites**:
   - A [Nerd Font](https://www.nerdfonts.com/) for icons
   - `make` for telescope-fzf-native
   - Ripgrep (`rg`) for fast searching

2. **Clone the configuration**:

   ```bash
   git clone https://github.com/dseravalli/nvim.config ~/.config/nvim
   ```

3. **First launch**:
   - Open Neovim: `nvim`
   - Lazy.nvim will automatically install all plugins
   - Mason will install configured LSP servers and tools
   - Run `:checkhealth` to verify everything is working

## Key Mappings

### Leader Key

- Leader is set to `<Space>`

### Essential Mappings

- `<C-p>` - Find git files
- `<leader>sf` - Search files
- `<leader>sg` - Live grep
- `<leader><space>` - Switch buffers
- `-` - Open file explorer (oil.nvim)
- `<leader>u` - Toggle undo tree
- `gcc` - Toggle comment line
- `gc` - Toggle comment (visual mode)

### LSP Mappings

- `gd` - Go to definition
- `gr` - Go to references
- `gi` - Go to implementation
- `K` - Hover documentation
- `<leader>rn` - Rename symbol
- `<leader>ca` - Code actions
- `<leader>f` - Format buffer

### Debugging

- `<leader>ds` - Start/Continue debugging
- `<leader>db` - Toggle breakpoint
- `<leader>dj` - Step over
- `<leader>dl` - Step into
- `<F7>` - Toggle debug UI

## Troubleshooting

1. **Slow startup**: Run `:Lazy profile` to see plugin load times
2. **Missing icons**: Install a Nerd Font
3. **LSP not working**: Run `:Mason` and ensure servers are installed
4. **Treesitter errors**: Run `:TSInstall` for missing parsers
