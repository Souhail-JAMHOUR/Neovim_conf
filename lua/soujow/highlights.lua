vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.background = 'dark'

require('onedark').setup {
  style = 'deep'
}
require('onedark').load()

-- vim.cmd [[colorscheme gruvbox]]
-- vim.g.catppuccin_flavour = "mocha"
