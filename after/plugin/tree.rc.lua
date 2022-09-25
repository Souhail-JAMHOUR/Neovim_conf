local status, tree = pcall(require, "nvim-tree")
if not status then
  return
end


local wk = require("which-key")



local km = {
  ["<leader>"] = {
    e = { "<cmd>NvimTreeToggle<CR>", "NvimTreeToggle" }
  }

}

wk.register(km)

--
tree.setup {
  disable_netrw = true,
  hijack_netrw = true,
  view = {
    adaptive_size = true,
    mappings = {
      custom_only = false,
      list = {
        { key = "u", action = "dir_up" },
      }
    },
  },
  filters = {
    custom = { ".git" },
  },
}

-- tree.setup()