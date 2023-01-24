local subdir = "user"
local config_files = {
  "options",
  "utils",
  "keymaps",
  "plugins",
  "colorscheme",
  "cmp",
  "mason_conf",
  "telescope",
  "treesitter",
  "autopairs",
  "comments",
  "dashboard",
  "bufferline",
  "feline_bar",
  "wich_key",
  "surround"
}

for _ , file  in ipairs(config_files ) do
  require(subdir .. "." .. file)
end
