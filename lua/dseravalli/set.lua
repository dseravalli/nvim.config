local lsp_dir = vim.fn.stdpath("config") .. "/lsp"
local lsp_configs = {}
for name, type in vim.fs.dir(lsp_dir) do
  if type == "file" and name:match("%.lua$") then
    table.insert(lsp_configs, (name:gsub("%.lua$", "")))
  end
end
vim.lsp.enable(lsp_configs)

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_perl_provider = 0
vim.o.guicursor = ""
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.number = true
vim.o.rnu = true
vim.o.mouse = "a"
vim.o.undofile = true
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.swapfile = false
vim.o.termguicolors = true
vim.o.colorcolumn = "80"
vim.o.scrolloff = 8
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.wrap = false
vim.o.updatetime = 300

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = "unnamedplus"

-- Keep signcolumn on by default
vim.o.signcolumn = "yes"

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Custom filetypes
vim.filetype.add({
  extension = {
    hbs = "html",
    keymap = "devicetree",
    templ = "templ",
    flux = "flux",
  },
  filename = {
    ["Podfile"] = "ruby",
  },
  pattern = {
    ["%.env%..*"] = "sh",
    [".*%.json%.jbuilder"] = "ruby",
  },
})

-- Configure diagnostics
vim.diagnostic.config({
  virtual_text = true,
})
