local status, whichkey = pcall(require, "which-key")
if (not status) then return end


local legendary = require "legendary"
local keymap_c = {}
-- local ft = vim.bo.filetype

local keymap = {
  ["<leader>"] = {
    f = {
      name = "+Find",
      b = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Buffers" },
      h = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "Help" },
      f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find Files" },
      m = { "<cmd>lua require('telescope.builtin').marks()<cr>", "Marks" },
      o = { "<cmd>lua require('telescope.builtin').oldfiles()<cr>", "Old Files" },
      g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Live Grep" },
      c = { "<cmd>lua require('telescope.builtin').commands()<cr>", "Commands" },
      r = { "<cmd>lua require'telescope'.extensions.file_browser.file_browser()<cr>", "File Browser" },
      w = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", "Current Buffer" },
      p = { "<cmd>lua require'telescope'.extensions.projects.projects{display_type = 'full'}<cr>", "List" },
    },
    d = {
      name = "Debug",
      R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
      E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
      C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
      U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
      b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
      c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
      d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
      e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
      g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
      h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
      S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
      i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
      o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
      p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
      q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
      r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
      s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
      t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
      x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
      u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
    }, c = keymap_c,
    g = {
      name = "+git",
      g = { "<cmd>LazyGit<CR>", "LazyGit" },
      f = { "<cmd>lua require('telescope.builtin').git_files()<CR>", "git_files" },
      b = { "<cmd>lua require('telescope.builtin').git_branches()<CR>", "git_branches" },
      c = { "<cmd>lua require('telescope.builtin').git_commits()<CR>", "git_commits" },
      h = { "<cmd>Gitsigns preview_hunk<CR>", "Hunk" }
    },
    s = { "<cmd>luafile %<cr>", "Source file" },
    l = {
      name = "+Lsp",
      a = { "<cmd>Lspsaga code_action<CR>", "Code Action" },
      f = { "<cmd>lua vim.lsp.buf.format({async =true})<CR>", "Formatting" },
    },
    n = {
      name = "Neotest",
      a = { "<cmd>lua require('neotest').run.attach()<cr>", "Attach" },
      f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run File" },
      F = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Debug File" },
      l = { "<cmd>lua require('neotest').run.run_last()<cr>", "Run Last" },
      L = { "<cmd>lua require('neotest').run.run_last({ strategy = 'dap' })<cr>", "Debug Last" },
      n = { "<cmd>lua require('neotest').run.run()<cr>", "Run Nearest" },
      N = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Debug Nearest" },
      o = { "<cmd>lua require('neotest').output.open({ enter = true })<cr>", "Output" },
      S = { "<cmd>lua require('neotest').run.stop()<cr>", "Stop" },
      s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Summary" },
    },
  }
}


local function code_keymap()
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
      vim.schedule(CodeRunner)
    end,
  })

  function CodeRunner()
    local bufnr = vim.api.nvim_get_current_buf()
    local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
    -- local fname = vim.fn.expand "%:p:t"
    -- local keymap_c = {} -- normal key map
    local keymap_c_v = {} -- visual key map
    -- if ft == "typescript" or ft == "typescriptreact" or ft == "javascript" or ft == "javascriptreact" then
    --   keymap_c = {
    --     name = "Code",
    --     o = { "<cmd>TypescriptOrganizeImports<cr>", "Organize Imports" },
    --     r = { "<cmd>TypescriptRenameFile<cr>", "Rename File" },
    --     i = { "<cmd>TypescriptAddMissingImports<cr>", "Import Missing" },
    --     F = { "<cmd>TypescriptFixAll<cr>", "Fix All" },
    --     u = { "<cmd>TypescriptRemoveUnused<cr>", "Remove Unused" },
    --     R = { "<cmd>lua require('config.neotest').javascript_runner()<cr>", "Choose Test Runner" },
    --     -- s = { "<cmd>2TermExec cmd='yarn start'<cr>", "Yarn Start" },
    --     -- t = { "<cmd>2TermExec cmd='yarn test'<cr>", "Yarn Test" },
    --   }
    if ft == "java" then
      keymap_c = {
        name = "Code",
        o = { "<cmd>lua require'jdtls'.organize_imports()<cr>", "Organize Imports" },
        v = { "<cmd>lua require('jdtls').extract_variable()<cr>", "Extract Variable" },
        c = { "<cmd>lua require('jdtls').extract_constant()<cr>", "Extract Constant" },
        t = { "<cmd>lua require('jdtls').test_class()<cr>", "Test Class" },
        n = { "<cmd>lua require('jdtls').test_nearest_method()<cr>", "Test Nearest Method" },
        u = { "<cmd>JdtUpdateConfig<cr>", "Update Config" },
      }
      keymap_c_v = {
        name = "Code",
        v = { "<cmd>lua require('jdtls').extract_variable(true)<cr>", "Extract Variable" },
        c = { "<cmd>lua require('jdtls').extract_constant(true)<cr>", "Extract Constant" },
        m = { "<cmd>lua require('jdtls').extract_method(true)<cr>", "Extract Method" },
      }

    elseif ft == "python" then
      keymap_c = {
        name = "Code",
        n = { "<cmd>lua require('dap-python').test_method()<CR>", "Test_nearest_method" },
        c = { "<Cmd>lua require('dap-python').test_class()<CR>", "Test_class" }
      }
      keymap_c_v = {
        d = { "<cmd>lua require('dap-python').debug_selection()<CR>", "Debug_selection" }
      }
    end

    -- if fname == "package.json" then
    --   keymap_c.v = { "<cmd>lua require('package-info').show()<cr>", "Show Version" }
    --   keymap_c.c = { "<cmd>lua require('package-info').change_version()<cr>", "Change Version" }
    --   -- keymap_c.s = { "<cmd>2TermExec cmd='yarn start'<cr>", "Yarn Start" }
    --   -- keymap_c.t = { "<cmd>2TermExec cmd='yarn test'<cr>", "Yarn Test" }
    -- end
    --
    -- if fname == "Cargo.toml" then
    --   keymap_c.u = { "<cmd>lua require('crates').upgrade_all_crates()<cr>", "Upgrade All Crates" }
    -- end

    if next(keymap_c) ~= nil then
      local k = { c = keymap_c }
      local o = { mode = "n", silent = true, noremap = true, buffer = bufnr, prefix = "<leader>", nowait = true }
      whichkey.register(k, o)
      legendary.bind_whichkey(k, o, false)
    end

    if next(keymap_c_v) ~= nil then
      local k = { c = keymap_c_v }
      local o = { mode = "v", silent = true, noremap = true, buffer = bufnr, prefix = "<leader>", nowait = true }
      whichkey.register(k, o)
      legendary.bind_whichkey(k, o, false)
    end
  end
end

whichkey.setup({
  code_keymap()
})
whichkey.register(keymap)
