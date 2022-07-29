local is_ok, neotest = pcall(require, "neotest")
if not is_ok then
  vim.notify("Error al cargar neotest")
  return
end

neotest.setup {
  adapters = {
    require("neotest-python")({
      -- Extra arguments for nvim-dap configuration
      dap = { justMyCode = false },
      -- Command line arguments for runner
      -- Can also be a function to return dynamic values
      args = {"--log-level", "DEBUG"},
      -- Runner to use. Will use pytest if available by default.
      -- Can be a function to return dynamic value.
      runner = "pytest",

      -- Returns if a given file path is a test file.
      -- NB: This function is called a lot so don't perform any heavy tasks within it.
      -- is_test_file = function(file_path)
      --   ...
      -- end,
    }),
    require("neotest-jest")({
      jestCommand = "npm test --",
      jestConfigFile = "jest.config.ts",
      env = { CI = true},
    }),
     require("neotest-rust")
  }
}

-- Set keymaps for running test functions

local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}


-- Jump to the next failed test
keymap("n", "<leader>tn", "<cmd>lua require('neotest').jump.next({status = 'failed'})<cr>", opts)
-- Jump to the previous failed test
keymap("n", "<leader>tp", "<cmd>lua require('neotest').jump.prev({status = 'failed'})<cr>", opts)


-- Toggle test summary
keymap("n", "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<cr>", opts)

-- Attach to the current test runner
keymap("n", "<leader>ta", "<cmd>lua require('neotest').run.attach({})<cr>", opts)

-- Stop current running test suite
keymap("n", "<leader>tS", "<cmd>lua require('neotest').run.stop({})<cr>", opts)

 -- Run current test
keymap("n", "<leader>tr", "<cmd>lua require('neotest').run.run()<cr>", opts)

-- Run the last running test
keymap("n", "<leader>tl", "<cmd>lua require('neotest').run.run_last()<cr>", opts)

-- Open the test output
keymap("n", "<leader>to", "<cmd>lua require('neotest').output.open({enter = true, short = true})<cr>", opts)

-- Run All test suite in the current file
keymap("n", "<leader>tR", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", opts)

