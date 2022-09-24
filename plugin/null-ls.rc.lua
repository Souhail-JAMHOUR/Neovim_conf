local status, null_ls = pcall(require, "null-ls")
if (not status) then return end
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint_d.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})'
    }),
    null_ls.builtins.formatting.autopep8,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.google_java_format,
  },
  on_attach = function(client, bufnr)
    if client.name == "jdt.ls" then
      client.resolved_capabilities.document_formatting = false
    end
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          vim.lsp.buf.formatting_sync()
        end,
      })
    end
  end,

})
