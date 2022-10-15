local wk = require("which-key")
local km = {
    ["<leader>"] = {
        e = { "<cmd>NvimTreeToggle<CR>", "NvimTreeToggle" }
    }

}

wk.register(km)


local status, nvim_tree = pcall(require, "nvim-tree")


if (not status) then
    return
end


nvim_tree.setup {
    disable_netrw = false,
    hijack_netrw = true,
    respect_buf_cwd = true,
    view = {
        number = true,
        relativenumber = true,
    },
    filters = {
        custom = { ".git" },
    },
    sync_root_with_cwd = true,
    update_focused_file = {
        enable = true,
        update_root = true,
    },
}
