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

 local plug_list = {
   require("user.plugins.gitsigns"),
   require("user.plugins.autopairs"),
   require("user.plugins.palenightfall"),
   require("user.plugins.markdown_preview"),
   require("user.plugins.cmp"),
   require("user.plugins.saga"),
   require("user.plugins.cmp-buffer"),
   require("user.plugins.cmp-path"),
   require("user.plugins.cmp_luasnip"),
   require("user.plugins.cmp-nvim-lsp"),
   require("user.plugins.cmp-nvim-lua"),
   require("user.plugins.cmp-zotcite"),

 -- snippets
   require("user.plugins.luasnipts"),
   require("user.plugins.friendly_snippets"),

 -- Linters stuff
   require("user.plugins.null-ls"),

   --Lsp Stuff
   require("user.plugins.mason"),
   require("user.plugins.telescope"),

   -- Telescope
   require("user.plugins.popup"),

 -- Treesitter
   require("user.plugins.treesitter"),
   require("user.plugins.treesitter-text-objects"),

 -- Rainbown
   require("user.plugins.rainbow"),

 -- nvim-comments
   require("user.plugins.comments"),

 -- Tmux navigation
   require("user.plugins.tmux"),

 -- Neogit
   require("user.plugins.neogit"),

 -- Dashboard
   require("user.plugins.dashboard"),


 -- dadbod for database management
   require("user.plugins.dadbod"),

 -- Nvim Tree
   require("user.plugins.nvim_tree"),

 -- Bufferline 
   require("user.plugins.bufferline"),

 -- feline bar
   require("user.plugins.feline"),

   -- neotest
   require("user.plugins.neotest"),
   require("user.plugins.neotest_rust"),
   require("user.plugins.neotest_elixir"),
   require("user.plugins.neotest_jest"),
   require("user.plugins.neotest_python"),

   -- wich key
   require("user.plugins.wich_key"),

   -- nvim-surround
   require("user.plugins.surround"),

   -- Github integration
   require("user.plugins.octo"),
   -- Harpoon
   require("user.plugins.harpoon"),

   -- Glow (show markdown preview inside neovim)
   require("user.plugins.glow"),

   require("user.plugins.ufo"),

   require("user.plugins.language_client_nvim"),
   require("user.plugins.mind"),

   require("user.plugins.neodev"),

   require("user.plugins.neorg"),
   require("user.plugins.asciidoc-preview"),
   require("user.plugins.venn"),


   require("user.plugins.fzf"),

   -- Better quickfix
   require("user.plugins.bqf"),
   require("user.plugins.trouble"),

   -- TODO-Comments
   require("user.plugins.todo_comments"),

   -- Noice
   require("user.plugins.noice"),

   require("user.plugins.bluloco"),

   -- transparency in neovim

   require("user.plugins.transparency"),

   -- Telekasten (zettelkasten for nvim)
   require("user.plugins.telekasten_plugin"),
   require("user.plugins.calendar"),

   require("user.plugins.zotcite"),

   -- Lisp Plugin
   require("user.plugins.conjure"),
   -- require("user.plugins.nvlime")

 }

local opts = {}
require("lazy").setup(plug_list, opts)
