require 'alpha'.setup(require 'alpha.themes.dashboard'.config)

local dashboard = require "alpha.themes.dashboard"

local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl_shortcut = "Macro"
  return b
end

dashboard.section.buttons.val = {
  button("f", " Find file", ":Telescope find_files <CR>"),
  button("e", " New file", ":ene <BAR> startinsert <CR>"),
  button("p", " Find project", ":lua require('telescope').extensions.project.project()<CR>"),
  button("r", " Recent files", ":Telescope oldfiles <CR>"),
  button("t", " Find text", ":Telescope live_grep <CR>"),
  -- dashboard.button("s", icons.ui.SignIn .. " Find Session", ":silent Autosession search <CR>"),
  -- button("s", " Find Session", ":SearchSession<CR>"),
  button("c", " Config", ":e ~/.config/nvim/init.lua <CR>"),
  button("u", " Update", ":PackerSync<CR>"),
  button("q", " Quit", ":qa<CR>"),
}
