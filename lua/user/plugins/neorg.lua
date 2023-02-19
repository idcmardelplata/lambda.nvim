return {
  "nvim-neorg/neorg",
  dependencies = { { "nvim-lua/plenary.nvim" } },
  build = ":Neorg sync-parsers",
  opts = {
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
      ["core.norg.completion"] = {
        config = {
          engine = "nvim-cmp",
        }
      },
      ["core.integrations.treesitter"] = {},
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

