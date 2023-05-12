-- FIX: Is necessary load the adapters from here to avoid generate redundancy.
return {"nvim-neotest/neotest",
lazy = true,
dependencies = {
  "nvim-lua/plenary.nvim",
  "nvim-treesitter/nvim-treesitter",
  { "antoinemadec/FixCursorHold.nvim", lazy = true }}
}
