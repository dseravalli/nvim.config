vim.g.mapleader = " "

-- Remove built-in diagnostics keymaps
-- vim.keymap.del('n', '<C-W>d')
-- vim.keymap.del('n', '<C-W><C-D>')

vim.keymap.set('n', 'Q', '<Nop>')

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('v', '<leader>p', "\"_dP", { desc = "Paste without overwrite" })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })
vim.keymap.set("n", "<leader>g", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Gsub word under cursor" })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- dont move cursor after J
vim.keymap.set("n", "J", "mzJ`z")

-- move V selection up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- center window after next/prev search result
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set('n', ']b', ':bn<CR>')
vim.keymap.set('n', '[b', ':bp<CR>')

vim.keymap.set("n", "]q", "<cmd>cnext<CR>zz", { desc = "Next quickfix" })
vim.keymap.set("n", "[q", "<cmd>cprev<CR>zz", { desc = "Prev quickfix" })

vim.keymap.set("n", "]l", "<cmd>lnext<CR>zz", { desc = "Next locationlist" })
vim.keymap.set("n", "[l", "<cmd>lprev<CR>zz", { desc = "Prev locationlist" })

vim.keymap.set('n', '<leader>m', ':MaximizerToggle<CR>', { desc = 'Toggle split full-screen' })

