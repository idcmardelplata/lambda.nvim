local mason = SafeRequire("mason")
local mason_config = SafeRequire("mason-lspconfig")


local servers = {
  -- "solidity",
  -- "marksman",
  -- "emmet_ls",
  -- "jsonls",
  -- "yamlls",
   "sumneko_lua",
   "rust_analyzer",
   "denols",
   "tsserver",
  -- "elixirls",
  -- "html",
  -- "jedi_language_server",
}

mason.setup {
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
}

mason_config.setup {
  ensure_installed = servers,
}

require("lspconfig").sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        version = "Lua 5.3",
        path = {
          '?.lua',
          '?/init.lua',
          vim.fn.expand'~/.luarocks/share/lua/5.3/?.lua',
          vim.fn.expand'~/.luarocks/share/lua/5.3/?/init.lua',
          '/usr/share/5.3/?.lua',
          '/usr/share/lua/5.3/?/init.lua'
        }
      },
      workspace = {
        library = {
          vim.fn.expand'~/.luarocks/share/lua/5.3',
          '/usr/share/lua/5.3'
        }
      }
    }
  }
}

require("lspconfig").rust_analyzer.setup {}
require("lspconfig").denols.setup {}


-- FIX: use autocommand for filetype detection and load the correct lsp-server

-- require("mason-lspconfig").setup_handlers = {
-- -- mason_config.setup_handlers = {
--   function (server_name)
--     require("lspconfig")[server_name].setup()
--   end,
--   ["rust_analyzer"] = function ()
--     require("rust-tools").setup()
--   end
-- }
