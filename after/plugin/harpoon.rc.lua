local status, harpoon = pcall(require, 'harpoon')
if not status then
  return
end

local wk = require("which-key")


harpoon.setup()


local km = {
  ['<leader>'] = {
    h = {
      name = "harpoon",
      a = { '<cmd>lua require("harpoon.mark").add_file()<CR>', "Add_File" },
      h = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', "Toggle_quick_menu" },
    }
  }
}


wk.register(km)
