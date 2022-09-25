local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use 'nvim-lualine/lualine.nvim' -- Statusline
  use 'nvim-lua/plenary.nvim' -- Common utilities
  use 'mfussenegger/nvim-jdtls'


  --LSP

  use 'neovim/nvim-lspconfig' -- LSP
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'glepnir/lspsaga.nvim' -- LSP UIs
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua

  --Completion

  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'hrsh7th/cmp-path' -- Path
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use "honza/vim-snippets"
  use 'folke/which-key.nvim' -- Keymaps helper with leader
  use 'mrjones2014/legendary.nvim'
  use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client
  use "rafamadriz/friendly-snippets"
  use 'saadparwaiz1/cmp_luasnip'
  use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }
  use 'L3MON4D3/LuaSnip'

  -- Debugging

  use 'mfussenegger/nvim-dap'
  use "rcarriga/nvim-dap-ui"
  use 'theHamsta/nvim-dap-virtual-text'
  use 'mfussenegger/nvim-dap-python'


  -- UI
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'norcalli/nvim-colorizer.lua'
  use 'akinsho/nvim-bufferline.lua'

  --colorscheme

  use 'LunarVim/darkplus.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }

  --Git
  use 'akinsho/toggleterm.nvim'
  use 'kdheepak/lazygit.nvim'
  use 'lewis6991/gitsigns.nvim'
  -- use 'dinhhuy258/git.nvim' -- For git blame & browse

  --Telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'nvim-telescope/telescope-project.nvim'

  -- Database
  use { 'tpope/vim-dadbod' }
  use { 'kristijanhusak/vim-dadbod-ui' }


  -- utilities
  use 'rcarriga/nvim-notify'
  -- use 'preservim/tagbar'
  use 'liuchengxu/vista.vim'
  use 'NTBBloodbath/rest.nvim'
  use 'windwp/nvim-autopairs'
  use "terrortylor/nvim-comment"
  use 'ThePrimeagen/harpoon'
  use 'windwp/nvim-ts-autotag'
  use 'folke/zen-mode.nvim'
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use "kyazdani42/nvim-tree.lua"
end)