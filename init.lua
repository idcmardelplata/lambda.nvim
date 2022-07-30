local subdir = "user"
local config_files = {
  "options",
  "keymaps",
  "plugins",
  "colorscheme",
  "cmp",
  "lsp",
  "telescope",
  "treesitter",
  "autopairs",
  "comments",
  "tmux",
  "neotest",
  "neogit",
  "dashboard",
  "gitsigns"
}

for _ , file  in ipairs(config_files ) do
  require(subdir .. "." .. file)
end
