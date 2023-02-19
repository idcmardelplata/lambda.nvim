return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig"
  },
  config = function ()
    local mason = require("mason")
    local mason_config = require("mason-lspconfig")

    local servers = {
      "lua_ls",
      "rust_analyzer",
      "denols",
      "tsserver",
      "emmet_ls",
      "marksman",
      "pyright",
      -- "solidity",
      -- "marksman",
      -- "emmet_ls",
      -- "jsonls",
      -- "yamlls",
      -- "elixirls",
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


    require("lspconfig").emmet_ls.setup {}

    local group = vim.api.nvim_create_augroup("MasonLspGroup", {clear = true})

    vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
      group = group,
      pattern = {"*.lua"},
      callback = function ()
        require("lspconfig").lua_ls.setup {}
      end
    })

    vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
      group = group,
      pattern = {"*.rs"},
      callback = function ()
        require("lspconfig").rust_analyzer.setup {}
      end
    })

    vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
      group = group,
      pattern = {"*.js", "*.ts"},
      callback = function ()
        require("lspconfig").tsserver.setup {}
      end
    })
  end
}
