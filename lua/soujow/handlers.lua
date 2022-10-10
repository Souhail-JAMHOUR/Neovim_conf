local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
    return
end
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)

M.setup = function()

    local config = {
        -- disable virtual text
        virtual_lines = false,
        virtual_text = false,
        -- virtual_text = {
        --   -- spacing = 7,
        --   -- update_in_insert = false,
        --   -- severity_sort = true,
        --   -- prefix = "<-",
        --   prefix = " ●",
        --   source = "if_many", -- Or "always"
        --   -- format = function(diag)
        --   --   return diag.message .. "blah"
        --   -- end,
        -- },

        -- show signs
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = true,
            style = "minimal",
            border = "rounded",
            -- border = {"▄","▄","▄","█","▀","▀","▀","█"},
            source = "if_many", -- Or "always"
            header = "",
            prefix = "",
            -- width = 40,
        },
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
        -- width = 60,
        -- height = 30,
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
        -- width = 60,
        -- height = 30,
    })
end


M.on_attach = function(client, bufnr)
    if client.name == "jdtls" then
        client.server_capabilities.document_formatting = false
    end

    if client.name == "tsserver" then
        client.server_capabilities.document_formatting = false
        require("lsp-inlayhints").on_attach(client, bufnr)
    end

    if client.name == "jdtls" then
        vim.lsp.codelens.refresh()
        require("jdtls").setup_dap { hotcodereplace = "auto" }
        require("jdtls.dap").setup_dap_main_class_configs()
    end
end

function M.enable_format_on_save()
    vim.cmd [[
    augroup format_on_save
      autocmd!
      autocmd BufWritePre * lua vim.lsp.buf.format({ async = false })
    augroup end
  ]]
    vim.notify "Enabled format on save"
end

function M.disable_format_on_save()
    M.remove_augroup "format_on_save"
    vim.notify "Disabled format on save"
end

function M.toggle_format_on_save()
    if vim.fn.exists "#format_on_save#BufWritePre" == 0 then
        M.enable_format_on_save()
    else
        M.disable_format_on_save()
    end
end

function M.remove_augroup(name)
    if vim.fn.exists("#" .. name) == 1 then
        vim.cmd("au! " .. name)
    end
end

vim.cmd [[ command! LspToggleAutoFormat execute 'lua require("soujow.lsp.handlers").toggle_format_on_save()' ]]

return M
