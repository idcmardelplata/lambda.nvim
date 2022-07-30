local config_files = {
  "user.options",
  "user.keymaps",
  "user.plugins",
  "user.colorscheme",
  "user.cmp",
  "user.lsp",
  "user.telescope",
  "user.treesitter",
  "user.autopairs",
  "user.comments",
  "user.tmux",
  "user.neotest",
  "user.neogit",
  "user.dashboard"
}

for _ , file  in ipairs(config_files ) do
  require(file)
end
