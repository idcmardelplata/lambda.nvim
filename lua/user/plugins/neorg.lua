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
        },
        default_workspace = "notes"
      },
    },
  },
},
}



return config
