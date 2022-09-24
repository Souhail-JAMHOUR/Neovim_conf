local status, tg = pcall(require, "toggleterm")
if not status then
  return
end

tg.setup(
  { direction = "float",
  })
