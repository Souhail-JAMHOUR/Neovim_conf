local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]
local status, packer = pcall(require, "packer")
if (not status) then
    print("Packer is not installed")
    return
end
packer.init {
    -- snapshot = "july-24",
    snapshot_path = fn.stdpath "config" .. "/snapshots",
    max_jobs = 50,
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
        prompt_border = "rounded", -- Border style of prompt popups.
    },
}

packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    use {
        'svrana/neosolarized.nvim',
        requires = { 'tjdevries/colorbuddy.nvim' }
    }
    use 'nvim-lualine/lualine.nvim' -- Statusline
    use 'nvim-lua/plenary.nvim' -- Common utilities
    use 'lewis6991/impatient.nvim'


    --LSP

    use 'neovim/nvim-lspconfig' -- LSP
    use 'onsails/lspkind-nvim' -- vscode-like pictograms
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use { 'glepnir/lspsaga.nvim', branch = "main" } -- LSP UIs
    use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
    use 'mfussenegger/nvim-jdtls'
    use 'lvimuser/lsp-inlayhints.nvim'

    --Completion

    use 'hrsh7th/nvim-cmp' -- Completion
    use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
    use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
    use 'hrsh7th/cmp-path' -- Path
    use 'saadparwaiz1/cmp_luasnip'
    use 'folke/which-key.nvim' -- Keymaps helper with leader
    use 'mrjones2014/legendary.nvim'
    use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client
    use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }
    use "ray-x/lsp_signature.nvim"


    --snippet

    use 'L3MON4D3/LuaSnip'
    use "honza/vim-snippets"
    use "rafamadriz/friendly-snippets"


    --Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'windwp/nvim-ts-autotag'
    use 'nvim-treesitter/nvim-treesitter-context'
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use "p00f/nvim-ts-rainbow"
    use "nvim-treesitter/nvim-treesitter-textobjects"


    -- Debugging

    use 'mfussenegger/nvim-dap'
    use "rcarriga/nvim-dap-ui"
    use 'theHamsta/nvim-dap-virtual-text'
    use 'mfussenegger/nvim-dap-python'
    use { 'dccsillag/magma-nvim', run = ':UpdateRemotePlugins' }


    -- UI
    use 'kyazdani42/nvim-web-devicons' -- File icons
    use 'norcalli/nvim-colorizer.lua'
    use 'akinsho/nvim-bufferline.lua'
    use 'goolord/alpha-nvim'
    use "SmiteshP/nvim-navic"
    use { 'fgheng/winbar.nvim' }

    --colorscheme

    use 'LunarVim/darkplus.nvim'
    use { "catppuccin/nvim", as = "catppuccin" }
    use 'shaunsingh/moonlight.nvim'
    use 'morhetz/gruvbox'
    use 'navarasu/onedark.nvim'
    use 'folke/tokyonight.nvim'

    --Test

    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-neotest/neotest-python",
            "nvim-neotest/neotest-go",
            "nvim-neotest/neotest-vim-test",
            "Issafalcon/neotest-dotnet"
        }
    }
    use 'vim-test/vim-test'



    --Git
    use 'akinsho/toggleterm.nvim'
    use 'kdheepak/lazygit.nvim'
    use 'lewis6991/gitsigns.nvim'
    -- use 'dinhhuy258/git.nvim' -- For git blame & browse

    --Telescope
    use 'nvim-telescope/telescope.nvim'
    use 'cljoly/telescope-repo.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'
    -- use 'nvim-telescope/telescope-project.nvim'
    use {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use { 'nvim-telescope/telescope-ui-select.nvim' }
    -- Database
    use { 'tpope/vim-dadbod' }
    use { 'kristijanhusak/vim-dadbod-ui' }


    -- utilities
    use 'rcarriga/nvim-notify'
    use 'liuchengxu/vista.vim'
    use 'kylechui/nvim-surround'
    use 'NTBBloodbath/rest.nvim'
    use 'windwp/nvim-autopairs'
    use "terrortylor/nvim-comment"
    use 'ThePrimeagen/harpoon'
    use 'folke/zen-mode.nvim'
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    use "kyazdani42/nvim-tree.lua"
    use 'tamago324/lir.nvim'
end)
