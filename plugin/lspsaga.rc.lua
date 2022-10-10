local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.init_lsp_saga({
    symbol_in_winbar = {
        in_custom = true
    },
})
-- local action = require("lspsaga.codeaction")
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gh', '<Cmd>Lspsaga lsp_finder<CR>', opts)
-- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)           -- Don't work anymore
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>", opts)
-- vim.keymap.set("n", "<leader>la", "<cmd>Lspsaga code_action<CR>")
-- vim.keymap.set("n", "<leader>i", "<cmd>LSoutlineToggle<CR>")


-- float terminal also you can pass the cli command in open_float_terminal function
vim.keymap.set("n", "<A-d>", "<cmd>Lspsaga open_floaterm <CR>", { silent = true })
-- close floaterm
vim.keymap.set("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })
