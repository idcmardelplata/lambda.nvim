local is_ok, ngit = pcall(require, "neogit")
if not is_ok then
  vim.notify("Error al cargar neogit")
  return
end

ngit.setup {
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

local keymap = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true}

-- Custom Neogit and DiffView keymaps

keymap("n", "<leader>gv", ":DiffviewOpen<cr>", opt)
keymap("n", "<leader>gc", ":DiffviewClose<cr>", opt)
keymap("n", "<leader>gg", ":Neogit<cr>", opt)
