local config =  {
  "nvim-neorg/neorg",
  tag = "v2.0.1",
  dependencies = { { "nvim-lua/plenary.nvim" },
  -- { "nvim-neorg/neorg-telescope" }
},
  build = ":Neorg sync-parsers",
  opts = {
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.autocommands"] = {},
      ["core.integrations.treesitter"] = {},
      ["core.norg.qol.toc"] = {},
      ["core.tangle"] = {},
      ["core.looking-glass"] = {},
      ["core.export"] = {},
      ["core.keybinds"] = {
        config = {
          hook = function(keybinds)
            -- New note
            keybinds.map("norg", "n", "<C-n>", ":Neorg keybind all core.norg.dirman.new.note<cr>")

            -- Move between headers
            keybinds.map("norg", "n", "}", ":Neorg keybind all core.integrations.treesitter.next.heading<cr>")
            keybinds.map("norg", "n", "{", ":Neorg keybind all core.integrations.treesitter.previous.heading<cr>")

            -- Move between links
            keybinds.map("norg", "n", "]", ":Neorg keybind all core.integrations.treesitter.next.link<cr>")
            keybinds.map("norg", "n", "[", ":Neorg keybind all core.integrations.treesitter.previous.link<cr>")

            -- Toggle looking-glass 
            keybinds.map("norg", "n", "gs", ":Neorg keybind all core.looking-glass.magnify-code-block<cr>")

            -- Quit Neorg
            keybinds.map("norg", "n", "gq", ":Neorg return<cr>")

          end
        }
      },
      ["core.norg.concealer"] = {
        config = {
          folds = true,
          icon_presset = "varied",
          markup_preset = "brave",
          icons = {
            definition = {
              enabled = { true },
              multi_prefix = {
                enabled  = true,
                icon = "⋙ ",
                query = "(multi_definition_prefix) @icon",
              },
              multi_suffix = {
                enabled = true,
                icon = "⋘ ",
                query = "(multi_definition_suffix) @icon"
              },
              single = {
                enabled = true,
                icon = "≡",
                query = "[ (single_definition_prefix) (link_target_definition) @no-conceal ] @icon",
              }
            },
          }
        }
      }, -- Adds pretty icons to your documents
      ["core.norg.completion"] = {
        config = {
          engine = "nvim-cmp",
        }
      },
      ["core.norg.dirman"] = { -- Manages Neorg workspaces
      config = {
        workspaces = {
          notes = "~/notes/notes",
          work = "~/notes/work",
          home = "~/notes/home",
          learn = "~/notes/learn",
          teach = "~/notes/teach",
        },
        default_workspace = "notes"
      },
    },
  },
},
}



return config
