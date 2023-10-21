return {
    'renerocksai/telekasten.nvim',
    dependencies = {'nvim-telescope/telescope.nvim'},
    config = function ()
      local telekasten = require("telekasten")
      telekasten.setup {
        home = vim.fn.expand("~/Documentos/Notes"),
        daily = vim.fn.expand("~/Documentos/Notes/daily"),
        weeklies = vim.fn.expand("~/Documentos/Notes/weeklies"),
        auto_set_syntax = true,
        template_new_note = vim.fn.expand("/home/martin/Documentos/Notes/templates/basenote.md"),
        install_syntax=true,
        extension=".md",
        tag_notation = "#tag",
        image_subdir=vim.fn.expand("~/Documentos/Notes/assets")
      }
    end
  }
