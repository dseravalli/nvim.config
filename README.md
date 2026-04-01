# Neovim Configuration

## Installation

1. **Prerequisites**:
   - neovim 0.12
   - A [Nerd Font](https://www.nerdfonts.com/) for icons
   - Ripgrep (`rg`) for fast searching

2. **Clone the configuration**:

   ```bash
   git clone https://github.com/dseravalli/nvim.config ~/.config/nvim
   ```

3. **First launch**:
   - Open Neovim: `nvim`
   - Lazy.nvim will automatically install all plugins
   - Mason will install configured LSP servers and tools
   - Treesitter will install all language parsers
   - Run `:checkhealth` to verify everything is working
