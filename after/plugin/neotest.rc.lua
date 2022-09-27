local status, neo = pcall(require, "neotest")
if not status then
  return
end

neo.setup {
  adapters = {
    require "neotest-python" {
      dap = { justMyCode = false },
      runner = "unittest",
    },
    require("neotest-plenary"),
  },
}
