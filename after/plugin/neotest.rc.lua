local status, neo = pcall(require, "neotest")
if not status then
  return
end

neo.setup {
  adapters = {
    require "neotest-python",
    require("neotest-plenary"),
    require("neotest-vim-test"),
  },
}
