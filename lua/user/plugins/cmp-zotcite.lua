return {
  'https://github.com/jalvesaq/cmp-zotcite',
  config = function ()
    local zotcite = require("cmp-zotcite")

    require("cmp").setup {
      sources = {
        {name = "cmp_zotcite"}
      }
    }

    zotcite.setup {
       filetypes = {"pandoc", "markdown", "rmd", "quarto"}
    }
  end
}
