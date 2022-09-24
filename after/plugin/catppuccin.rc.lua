local status, cap = pcall(require, 'catppuccin')
if (not status) then return end

cap.setup()
