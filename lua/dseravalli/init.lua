require("dseravalli.set")
require("dseravalli.remap")
require("dseravalli.lazy_init")

local augroup = vim.api.nvim_create_augroup
local DseravalliGroup = augroup('DSeravalli', {})
local yank_group = augroup('HighlightYank', {})
local autocmd = vim.api.nvim_create_autocmd

vim.filetype.add({
  extension = {
    keymap = 'devicetree',
    templ = 'templ',
  },
  filename = {
    ['Podfile'] = 'ruby',
  },
  pattern = {
    ['%.env%..*'] = 'sh',
    ['.*%.json%.jbuilder'] = 'ruby'
  },
})

autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40,
    })
  end,
})

autocmd({ "BufWritePre" }, {
  group = DseravalliGroup,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

