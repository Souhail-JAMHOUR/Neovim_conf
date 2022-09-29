local status, neo = pcall(require, "neotest")
if not status then
  return
end

neo.setup {
  adapters = {
    require("neotest-vim-test"),
    require("neotest-python"),
    require("neotest-dotnet")
  },
}
