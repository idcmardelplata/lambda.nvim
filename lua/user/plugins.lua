local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd([[
--   augroup lazy_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | Lazy sync
--   augroup end
-- ]])



local plug_list = {

{ 'lewis6991/gitsigns.nvim',
  keys={"<leader>g"},
  dependencies = { 'nvim-lua/plenary.nvim' },
  lazy = true,
  config = function() require("user.gitsigns") end
},

{ "windwp/nvim-autopairs", lazy = true},
-- 'ghifarit53/tokyonight-vim',
{ 'navarasu/onedark.nvim', lazy = true },
{ "iamcco/markdown-preview.nvim",
  build = "cd app && npm install",
  setup = function() vim.g.mkdp_filetypes = { "markdown", "md" } end,
  ft = { "markdown" },
  lazy = true,
},

-- cmp plugins
{ "hrsh7th/nvim-cmp", commit = "df6734aa018d6feb4d76ba6bda94b1aeac2b378a" }, -- The completion plugin
{ "hrsh7th/cmp-buffer", commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323"}, -- buffer completions
{ "hrsh7th/cmp-path", commit = "466b6b8270f7ba89abd59f402c73f63c7331ff6e" }, -- path completions
{ "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36"}, -- snippet completions
{ "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8"},
{ "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21", lazy = true },
{ "glepnir/lspsaga.nvim", branch = "main" },



-- snippets
{ "L3MON4D3/LuaSnip", commit = "79b2019c68a2ff5ae4d732d50746c901dd45603a", lazy = true }, --snippet engineS
{ "rafamadriz/friendly-snippets", commit = "d27a83a363e61009278b6598703a763ce9c8e617", lazy = true }, -- a bunch of snippets to use


-- Linters stuff
{ "jose-elias-alvarez/null-ls.nvim", commit = "c0c19f32b614b3921e17886c541c13a72748d450", lazy = true }, -- for formatters and linters


  --Lsp Stuff
{ "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig", lazy = true },


-- Telescope
{ "nvim-telescope/telescope.nvim", commit = "d96eaa914aab6cfc4adccb34af421bdd496468b0", lazy = true },
{'nvim-lua/popup.nvim'},
{ 'nvim-telescope/telescope-media-files.nvim', lazy = true},
{'xiyaowong/telescope-emoji.nvim', lazy = true},


-- Treesitter
{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},


-- Rainbown
{ "p00f/nvim-ts-rainbow", lazy = true },

-- nvim-comments
{ "numToStr/Comment.nvim", commit = "2c26a00f32b190390b664e56e32fd5347613b9e2", lazy = true },
{ "JoosepAlviste/nvim-ts-context-commentstring", commit = "88343753dbe81c227a1c1fd2c8d764afb8d36269", lazy = true   },

-- Tmux navigation
{ "aserowy/tmux.nvim", lazy = true },


-- Neogit
{ 'TimUntersberger/neogit', dependencies = 'nvim-lua/plenary.nvim', { 'sindrets/diffview.nvim', lazy = true }, lazy = true },

-- Dashboard
 {'glepnir/dashboard-nvim', lazy = true},

-- dadbod for database management
 {"tpope/vim-dadbod", lazy = true},
 {'kristijanhusak/vim-dadbod-ui', afer="tpope/vim-dadbod", dependencies="tpope/vim-dadbod", lazy = true},

-- Nvim Tree
 { 'kyazdani42/nvim-tree.lua', dependencies = { 'kyazdani42/nvim-web-devicons'}, lazy = true},

-- Bufferline 
 {'akinsho/bufferline.nvim',  dependencies = 'kyazdani42/nvim-web-devicons', lazy = true},

-- feline bar
 { 'feline-nvim/feline.nvim', branch = '0.5-compat', lazy = true },

 {"nvim-neotest/neotest", lazy = true,
 dependencies = {
   "nvim-lua/plenary.nvim",
   "nvim-treesitter/nvim-treesitter",
   {    "antoinemadec/FixCursorHold.nvim", lazy = true },
  }
},


   {"rouge8/neotest-rust",  dependencies={"nvim-neotest/neotest", "nvim-lua/plenary.nvim" }, lazy = true, ft="rust"},
   { "jfpedroza/neotest-elixir",dependencies={"nvim-neotest/neotest", "nvim-lua/plenary.nvim"}, lazy = true},
   { "haydenmeade/neotest-jest", dependencies={"nvim-neotest/neotest", "nvim-lua/plenary.nvim"}, lazy = true},

  -- wich key
   { "folke/which-key.nvim", commit = "bd4411a2ed4dd8bb69c125e339d837028a6eea71", lazy = true },

  -- nvim-surround
  { "kylechui/nvim-surround", lazy = true},

  -- Github integration
   {
  'pwntester/octo.nvim', lazy = true,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'kyazdani42/nvim-web-devicons',
  }},

  -- Harpoon
   {  'ThePrimeagen/harpoon', dependencies = 'nvim-lua/plenary.nvim', lazy = true },

  -- Glow (show markdown preview inside neovim)
   {"ellisonleao/glow.nvim", ft={"markdown", "md"}, lazy = true},

   {'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async', lazy = true}, -- for folding  purposes

  {'simrat39/rust-tools.nvim',
    dependencies = {'neovim/nvim-lspconfig', 'nvim-lua/plenary.nvim', 'https://github.com/mattn/webapi-vim'},
    ft = "rust",
    lazy = true
  },

   {'autozimu/LanguageClient-neovim', branch="next", build="bash install.sh", lazy = true},

   {
    'phaazon/mind.nvim',
    lazy = true,
    branch = 'v2.2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require 'mind'.setup()
    end
},


}

local opts = {}


require("lazy").setup(plug_list, opts)


