vim.g.mapleader = " "

-- Leader namespace index
-- Keymaps are co-located with plugin specs for lazy-loading.
-- This is a reference of where each namespace is defined.
--
-- <leader>c       close buffer                     snacks.lua
-- <leader>d       debug (DAP)                      debug.lua
-- <leader>e       file explorer                    snacks.lua
-- <leader>f       find (files, buffers, git)       snacks.lua
-- <leader>g       git (lazygit, blame, log, diff)  snacks.lua, remap.lua
-- <leader>k       signature help                   remap.lua
-- <leader>m       maximizer                        remap.lua
-- <leader>n       notifications                    snacks.lua
-- <leader>p       paste / possession (sessions)    remap.lua, possession.lua
-- <leader>r       refactor / rename                remap.lua, refactoring.lua
-- <leader>s       search (grep, LSP, pickers)      snacks.lua
-- <leader>t       test (neotest) / trouble         neotest.lua, trouble.lua
-- <leader>u       undo / UI (colorscheme)          undotree.lua, snacks.lua
-- <leader>x       make file executable             remap.lua

vim.keymap.set("n", "Q", "<Nop>")
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set("v", "<leader>p", '"_dP', { desc = "Paste without overwrite" })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })
vim.keymap.set(
  "n",
  "<leader>rs",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Refactor substitute word under cursor" }
)

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- dont move cursor after J
vim.keymap.set("n", "J", "mzJ`z")

-- move V selection up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- center window after next/prev search result
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- center window after ctrl-d/ctrl-u
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "]q", "<cmd>cnext<CR>zz", { desc = "Next quickfix" })
vim.keymap.set("n", "[q", "<cmd>cprev<CR>zz", { desc = "Prev quickfix" })

vim.keymap.set("n", "]l", "<cmd>lnext<CR>zz", { desc = "Next locationlist" })
vim.keymap.set("n", "[l", "<cmd>lprev<CR>zz", { desc = "Prev locationlist" })

vim.keymap.set("n", "<leader>m", ":MaximizerToggle<CR>", { desc = "Toggle split full-screen" })

-- LSP
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, { desc = "Signature Documentation" })

-- Add a shortcut for Diffview under the same g menu setup for Lazygit by snacks
vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Diffview Open" })

-- Disable native LSP keymaps that conflict with Snacks pickers
for _, key in ipairs({ "gra", "grr", "gri", "grn", "grt", "grx" }) do
  vim.keymap.set("n", key, "<Nop>")
end

-- Float diagnostic
vim.keymap.set("n", "]d", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next diagnostic" })
vim.keymap.set("n", "[d", function()
  vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Prev diagnostic" })
