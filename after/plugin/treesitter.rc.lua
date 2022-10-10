local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = true,
        disable = { "python", "css", "rust" },
    },
    ensure_installed = {
        "tsx",
        "toml",
        "fish",
        "php",
        "json",
        "yaml",
        "swift",
        "css",
        "html",
        "lua"
    },
    autotag = {
        enable = true,
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    rainbow = {
        enable = true,
        extended_mode = false,
        colors = {
            -- "#68a0b0",
            -- "#946EaD",
            -- "#c7aA6D",
            "Gold",
            "Orchid",
            "DodgerBlue",
            -- "Cornsilk",
            -- "Salmon",
            -- "LawnGreen",
        },
        disable = { "html" },
    },
    textobjects = {
        select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["at"] = "@class.outer",
                ["it"] = "@class.inner",
                ["ac"] = "@call.outer",
                ["ic"] = "@call.inner",
                ["aa"] = "@parameter.outer",
                ["ia"] = "@parameter.inner",
                ["al"] = "@loop.outer",
                ["il"] = "@loop.inner",
                ["ai"] = "@conditional.outer",
                ["ii"] = "@conditional.inner",
                ["a/"] = "@comment.outer",
                ["i/"] = "@comment.inner",
                ["ab"] = "@block.outer",
                ["ib"] = "@block.inner",
                ["as"] = "@statement.outer",
                ["is"] = "@scopename.inner",
                ["aA"] = "@attribute.outer",
                ["iA"] = "@attribute.inner",
                ["aF"] = "@frame.outer",
                ["iF"] = "@frame.inner",
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ["]m"] = "@function.outer",
                ["]]"] = "@class.outer",
            },
            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer",
            },
            goto_previous_start = {
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer",
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer",
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ["<leader>."] = "@parameter.inner",
            },
            swap_previous = {
                ["<leader>,"] = "@parameter.inner",
            },
        },
    },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }


local status_context, context = pcall(require, "treesitter-context")
if (not status_context) then
    return
end

context.setup()
