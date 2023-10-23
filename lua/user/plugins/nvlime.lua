return {
  "monkoose/nvlime",
  dependencies ={  "monkoose/parsley" , "gpanders/nvim-parinfer" },
  ft= "lisp",
  lazy=true,
  cmp_enabled = true,
  config = function ()
    require "cmp".setup.filetype({'lisp'}, {
      sources = {
        { name = "nvlime"}
      }
    })
  end

}
