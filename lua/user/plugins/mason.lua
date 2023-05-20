return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig"
  },
  config = function ()
    local mason = require("mason")
    local mason_config = require("mason-lspconfig")

    -- local on_attach = require("lspconfig").on_attach
    local capabilities = require("lspconfig").capabilities
    local lspconfig = require("lspconfig")

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


    lspconfig.emmet_ls.setup {}

    local group = vim.api.nvim_create_augroup("MasonLspGroup", {clear = true})

    vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"} , {
      group = group,
      pattern = {"*.lua"},
      callback = function ()
        require("lspconfig").lua_ls.setup {
          settings = {
            Lua = {
              runtime = {
                version = 'LuaJIT',
                path = vim.split(package.path, ';'),
              },
              diagnostics = {
                globals = { 'vim' },
              },
              workspace = {
                library = {
                  [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                  [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                },
              },
            },
          },
        }
      end
    })


    vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
      group = group,
      pattern = {"*.rs"},
      callback = function ()
        require("lspconfig").rust_analyzer.setup {
          -- on_attach = on_attach,
          -- capabilities = capabilities,
          filetypes = {"rust"},
          root_dir = require("lspconfig/util").root_pattern("Cargo.toml"),

          settings = {
            ['rust_analyzer'] = {
              imports = {
                granularity = {
                  group = "module",
                },
                prefix = "self",
              },
              cargo = {
                buildScripts = {
                  allFeatures = true,
                },
              },
              procMacro = {
                enable = true
              },
            }
          }
        }
      end
    })

    vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"},  {
      group = group,
      pattern = {"*.js", "*.ts"},
      callback = function ()
        require("lspconfig").tsserver.setup {}
      end
    })

    vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
      group = group,
      pattern = {"*.py"},
      callback = function ()
        require("lspconfig").pyright.setup {}
      end
    })

  end
}
