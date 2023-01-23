return {
  "jfpedroza/neotest-elixir",
  dependencies={"nvim-neotest/neotest", "nvim-lua/plenary.nvim"},
  lazy = true,
  ft="elixir",
  config = function()
    require("neotest").setup({ adapters = {require("neotest-elixir")}})
  end
}
