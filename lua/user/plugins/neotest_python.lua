return {
  "nvim-neotest/neotest-python",
  dependencies={"nvim-neotest/neotest", "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
  lazy = true,
  ft="python",
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-python")({
          -- dap = {
          --   justMyCode = false,
          --   console = "integratedTerminal",
          -- },
          args = { "--log-level", "DEBUG", "--quiet" },
          runner = "pytest",
          python= ".env/bin/python",
          pytest_discover_instances = false,
        })
      }
    })
  end
}
