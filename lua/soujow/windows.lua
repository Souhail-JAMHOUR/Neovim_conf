vim.opt.clipboard:prepend { 'unnamed', 'unnamedplus' }


if vim.fn.has "wsl" == 1 then
  vim.g.clipboard = {
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
  }
end
