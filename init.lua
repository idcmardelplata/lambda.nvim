local subdir = "user"
local config_files = {
  "options",
  "utils",
  "keymaps",
  "plugins",
}



for _ , file  in ipairs(config_files ) do
  require(subdir .. "." .. file)
end

vim.opt.termguicolors = true
vim.cmd('colorscheme bluloco')



