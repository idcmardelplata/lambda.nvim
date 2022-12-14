local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})


return packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Use dependency and run lua function after load
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

 -- themes
  use 'ghifarit53/tokyonight-vim'
  use 'navarasu/onedark.nvim'
  -- autopairs
  use { "windwp/nvim-autopairs"}

  use(
    { "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      setup = function() vim.g.mkdp_filetypes = { "markdown", "md" } end,
      ft = { "markdown" },
    })



    -- cmp plugins
    use({ "hrsh7th/nvim-cmp", commit = "df6734aa018d6feb4d76ba6bda94b1aeac2b378a" }) -- The completion plugin
    use({ "hrsh7th/cmp-buffer", commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323" }) -- buffer completions
    use({ "hrsh7th/cmp-path", commit = "466b6b8270f7ba89abd59f402c73f63c7331ff6e" }) -- path completions
    use({ "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }) -- snippet completions
     use({ "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" })
    use({ "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" })
    use({ "glepnir/lspsaga.nvim", branch = "main" })
	-- snippets
	use({ "L3MON4D3/LuaSnip", commit = "79b2019c68a2ff5ae4d732d50746c901dd45603a" }) --snippet engine
	use({ "rafamadriz/friendly-snippets", commit = "d27a83a363e61009278b6598703a763ce9c8e617" }) -- a bunch of snippets to use

  -- Linters stuff
	use({ "jose-elias-alvarez/null-ls.nvim", commit = "c0c19f32b614b3921e17886c541c13a72748d450" }) -- for formatters and linters


  --Lsp Stuff
  use { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig" }

  -- Telescope
  use({ "nvim-telescope/telescope.nvim", commit = "d96eaa914aab6cfc4adccb34af421bdd496468b0" })
  use({'nvim-lua/popup.nvim'})
  use({ 'nvim-telescope/telescope-media-files.nvim'})
  use({'xiyaowong/telescope-emoji.nvim'})

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'}

  -- Rainbown
  use "p00f/nvim-ts-rainbow"

    -- nvim-comments
  use({ "numToStr/Comment.nvim", commit = "2c26a00f32b190390b664e56e32fd5347613b9e2" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring", commit = "88343753dbe81c227a1c1fd2c8d764afb8d36269" })

  -- Tmux navigation
  use({ "aserowy/tmux.nvim"})


  -- Neogit
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim' }

  -- Dashboard
  use {'glepnir/dashboard-nvim'}

  -- dadbod for database management
  use {"tpope/vim-dadbod"}
  use {'kristijanhusak/vim-dadbod-ui', afer="tpope/vim-dadbod", requires="tpope/vim-dadbod"}

  -- Nvim Tree
  use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons'}}

  -- Bufferline 
  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

  -- feline bar
  use { 'feline-nvim/feline.nvim', branch = '0.5-compat' }

  use {"nvim-neotest/neotest",
  requires = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    }
  }


  use {"rouge8/neotest-rust",  requires={"nvim-neotest/neotest", "nvim-lua/plenary.nvim" }}
  use { "jfpedroza/neotest-elixir",requires={"nvim-neotest/neotest", "nvim-lua/plenary.nvim"}}
  use { "haydenmeade/neotest-jest", requires={"nvim-neotest/neotest", "nvim-lua/plenary.nvim"}}

  -- wich key
  use { "folke/which-key.nvim", commit = "bd4411a2ed4dd8bb69c125e339d837028a6eea71" }

  -- nvim-surround
  use({ "kylechui/nvim-surround"})

  -- Github integration
  use {
  'pwntester/octo.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'kyazdani42/nvim-web-devicons',
  }}

  -- Harpoon
  use {  'ThePrimeagen/harpoon', requires = 'nvim-lua/plenary.nvim' }

  -- Glow (show markdown preview inside neovim)
  use {"ellisonleao/glow.nvim", ft={"markdown", "md"}}

  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

  use{'simrat39/rust-tools.nvim',
    requires = {'neovim/nvim-lspconfig', 'nvim-lua/plenary.nvim'},
    ft = "rust"
  }

  use {'autozimu/LanguageClient-neovim', branch="next", run="bash install.sh"}

  if PACKER_BOOTSTRAP  then
    require("packer").PackerSync()
  end

end)
