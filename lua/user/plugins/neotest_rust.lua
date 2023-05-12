-- FIX: This adapter should be loaded from neotest config file
return {
  "rouge8/neotest-rust",
  dependencies={"nvim-neotest/neotest",
  "nvim-lua/plenary.nvim" },
  lazy = true,
  ft="rust",
  config = function()
    require("neotest").setup({ adapters = {require("neotest-rust")}})
  end
}
