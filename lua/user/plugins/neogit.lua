return {'TimUntersberger/neogit',
lazy = true,
dependencies = 'nvim-lua/plenary.nvim',
{'sindrets/diffview.nvim', lazy = true },
keys = "<leader>gg",
config = function ()
  require("neogit").setup {
    disable_signs = false,
    disable_hint = false,
    disable_context_highlighting = false,
    disable_commit_confirmation = true,
    -- Neogit refreshes its internal state after specific events, which can be expensive depending on the repository size. 
    -- Disabling `auto_refresh` will make it so you have to manually refresh the status after you open it.
    integrations = {
      diffview = true
    },
    -- Setting any section to `false` will make the section not render at all
  }
end
}
