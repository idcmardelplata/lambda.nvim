return {
    "Olical/conjure",
    ft = { "lisp",  "clojure", "fennel", "python" }, -- etc
    -- [Optional] cmp-conjure for cmp
    -- dependencies = {
    --     {
            -- "PaterJason/cmp-conjure",
            -- config = function()
            --     local cmp = require("cmp")
            --     local config = cmp.get_config()
            --     table.insert(config.sources, {
            --         name = "buffer",
            --         option = {
            --             sources = {
            --                 { name = "conjure" },
            --             },
            --         },
            --     })
            --     cmp.setup(config)
            -- require "cmp".setup {
            --   sources = {
            --     name = "conjure"
            --   }
            -- }
            --  end
    --     },
    -- },
    dependencies = {"PaterJason/cmp-conjure",   "monkoose/parsley" , "gpanders/nvim-parinfer" },
    config = function(_, opts)
        require "cmp".setup {
          source = { name = "conjure"},
        }
        require("conjure.main").main()
        require("conjure.mapping")["on-filetype"]()
    end,
    init = function()
	       -- Set configuration options here
        vim.g["conjure#debug"] = true
    end,
}
