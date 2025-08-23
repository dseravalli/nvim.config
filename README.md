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

## Plugins

### Core

- **[lazy.nvim](https://github.com/folke/lazy.nvim)** - Plugin manager with lazy loading support
- **[plenary.nvim](https://github.com/nvim-lua/plenary.nvim)** - Lua utility library required by many plugins
- **[nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)** - File type icons

### UI & Navigation

- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** - Fuzzy finder for files, buffers, and more
- **[telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)** - FZF sorter for telescope performance
- **[oil.nvim](https://github.com/stevearc/oil.nvim)** - File explorer that edits directories like buffers
- **[bufferline.nvim](https://github.com/akinsho/bufferline.nvim)** - Enhanced buffer/tab display
- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)** - Fast and customizable statusline
- **[indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)** - Display indent guides
- **[which-key.nvim](https://github.com/folke/which-key.nvim)** - Shows available keybindings in popup
- **[snacks.nvim](https://github.com/folke/snacks.nvim)** - Collection of small QoL utilities

### Colorschemes

- **[tokyonight.nvim](https://github.com/folke/tokyonight.nvim)** - Clean, dark colorscheme (primary)
- **[rose-pine](https://github.com/rose-pine/neovim)** - Minimalist pine-themed colorscheme

### LSP & Completion

- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)** - Quickstart configs for Neovim LSP
- **[mason.nvim](https://github.com/williamboman/mason.nvim)** - Portable package manager for LSP servers
- **[mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)** - Bridge between mason and lspconfig
- **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)** - Completion engine
- **[cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)** - LSP source for nvim-cmp
- **[cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)** - Snippet source for nvim-cmp
- **[LuaSnip](https://github.com/L3MON4D3/LuaSnip)** - Snippet engine
- **[friendly-snippets](https://github.com/rafamadriz/friendly-snippets)** - Collection of snippets
- **[lazydev.nvim](https://github.com/folke/lazydev.nvim)** - Neovim development setup
- **[fidget.nvim](https://github.com/j-hui/fidget.nvim)** - LSP progress notifications

### Syntax & Formatting

- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** - Syntax highlighting and code understanding
- **[templ.vim](https://github.com/joerdav/templ.vim)** - Go template syntax support
- **[tree-sitter-templ](https://github.com/vrischmann/tree-sitter-templ)** - Treesitter parser for templ
- **[conform.nvim](https://github.com/stevearc/conform.nvim)** - Lightweight formatter plugin
- **[tailwind-sorter.nvim](https://github.com/laytan/tailwind-sorter.nvim)** - Sort Tailwind CSS classes

### Git

- **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)** - Git decorations and hunk actions

### Debugging & Testing

- **[nvim-dap](https://github.com/mfussenegger/nvim-dap)** - Debug Adapter Protocol client
- **[nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)** - UI for nvim-dap
- **[nvim-dap-go](https://github.com/leoluz/nvim-dap-go)** - Go debugging support
- **[nvim-dap-python](https://github.com/mfussenegger/nvim-dap-python)** - Python debugging support
- **[nvim-dap-vscode-js](https://github.com/mxsdev/nvim-dap-vscode-js)** - JavaScript debugging support
- **[mason-nvim-dap.nvim](https://github.com/jay-babu/mason-nvim-dap.nvim)** - Bridge between mason and dap
- **[nvim-nio](https://github.com/nvim-neotest/nvim-nio)** - Async IO library for Neovim
- **[neotest](https://github.com/nvim-neotest/neotest)** - Test runner framework
- **[neotest-python](https://github.com/nvim-neotest/neotest-python)** - Python test adapter

### Editing

- **[Comment.nvim](https://github.com/numToStr/Comment.nvim)** - Smart commenting with motions
- **[vim-maximizer](https://github.com/szw/vim-maximizer)** - Toggle maximize current window
- **[neoscroll.nvim](https://github.com/karb94/neoscroll.nvim)** - Smooth scrolling
- **[refactoring.nvim](https://github.com/ThePrimeagen/refactoring.nvim)** - Refactoring tools
- **[undotree](https://github.com/mbbill/undotree)** - Visualize undo history
- **[vim-suda](https://github.com/lambdalisue/vim-suda)** - Write files with sudo

### Navigation & Workflow

- **[vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)** - Seamless navigation between vim and tmux
- **[possession.nvim](https://github.com/jedrzejboczar/possession.nvim)** - Session management
- **[trouble.nvim](https://github.com/folke/trouble.nvim)** - Pretty diagnostics list

### AI & Productivity

- **[copilot.lua](https://github.com/zbirenbaum/copilot.lua)** - GitHub Copilot integration
- **[copilot-cmp](https://github.com/zbirenbaum/copilot-cmp)** - Copilot completion source for nvim-cmp

### Language Specific

- **[kmonad-vim](https://github.com/kmonad/kmonad-vim)** - Syntax highlighting for KMonad files

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
