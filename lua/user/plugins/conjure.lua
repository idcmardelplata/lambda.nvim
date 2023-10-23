return {
    "Olical/conjure",
    ft = { "lisp",  "clojure", "fennel", "python" }, -- etc
    dependencies = {"PaterJason/cmp-conjure",   "monkoose/parsley" , "gpanders/nvim-parinfer" },
    config = function(_, opts)
        require "cmp".setup {
          source = { name = "conjure"},
        }

        -- auto start the server
        vim.fn.jobstart("ros run --eval '(ql:quickload :swank)'  --eval '(swank:create-server :dont-close t)'")


        require("conjure.main").main()
        require("conjure.mapping")["on-filetype"]()

    end,
    init = function()
	       -- Set configuration options here
        vim.g["conjure#debug"] = true
    end,
}
