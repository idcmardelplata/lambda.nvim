local is_ok, saga = pcall(require, "lspsaga")
if not is_ok then
  error("Error al cargar lspsaga")
  return
end



-- use custom config
saga.init_lsp_saga({

border_style = "single",
--the range of 0 for fully opaque window (disabled) to 100 for fully
--transparent background. Values between 0-30 are typically most useful.
saga_winblend = 30,

-- when cursor in saga window you config these to move
move_in_saga = { prev = '<C-p>',next = '<C-n>'},
-- Error, Warn, Info, Hint
-- use emoji like
-- { "🙀", "😿", "😾", "😺" }
-- or
-- { "😡", "😥", "😤", "😐" }
-- and diagnostic_header can be a function type
-- must return a string and when diagnostic_header
-- is function type it will have a param `entry`
-- entry is a table type has these filed
-- { bufnr, code, col, end_col, end_lnum, lnum, message, severity, source }
diagnostic_header =  { " ", " ", " ", "ﴞ " },
-- show diagnostic source
show_diagnostic_source = true,
-- add bracket or something with diagnostic source, just have 2 elements
diagnostic_source_bracket = {},
-- preview lines of lsp_finder and definition preview
max_preview_lines = 10,
-- use emoji lightbulb in default
code_action_icon = "💡",
-- if true can press number to execute the codeaction in codeaction window
code_action_num_shortcut = true,
-- same as nvim-lightbulb but async
code_action_lightbulb = {
    enable = true,
    sign = true,
    enable_in_insert = true,
    sign_priority = 20,
    virtual_text = true,
},
-- finder icons
finder_icons = {
  def = '  ',
  ref = '諭 ',
  link = '  ',
},
-- custom finder title winbar function type
-- param is current word with symbol icon string type
-- return a winbar format string like `%#CustomFinder#Test%*`
finder_action_keys = {
    open = "o",
    vsplit = "s",
    split = "i",
    tabe = "t",
    quit = "q",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>", -- quit can be a table
},
code_action_keys = {
    quit = "q",
    exec = "<CR>",
},
rename_action_quit = "<C-c>",
rename_in_select = true,
definition_preview_icon = "  ",
-- show symbols in winbar must nightly
symbol_in_winbar = {
    in_custom = false,
    enable = false,
    separator = ' ',
    show_file = true,
    click_support = false,
},
-- show outline
show_outline = {
  win_position = 'right',
  --set special filetype win that outline window split.like NvimTree neotree
  -- defx, db_ui
  win_with = '',
  win_width = 30,
  auto_enter = true,
  auto_preview = true,
  virt_text = '┃',
  jump_key = 'o',
  -- auto refresh when change buffer
  auto_refresh = true,
},
})


-- Configure code actions
local action = require("lspsaga.codeaction")

-- code action
-- vim.keymap.set("n", "<leader>ca", action.code_action, { silent = true,noremap = true })
  vim.keymap.set("v", "<leader>ca", function()
    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
    action.range_code_action()
end, { silent = true,noremap =true })

-- vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true,noremap = true })
-- vim.keymap.set("v", "<leader>ca", "<cmd><C-u>Lspsaga range_code_action<CR>", { silent = true,noremap = true })


-- Configure finder
-- vim.keymap.set("n","gh", require("lspsaga.finder").lsp_finder, { silent = true,noremap = true })

-- Configure documentation
-- vim.keymap.set("n", "K", require("lspsaga.hover").render_hover_doc, { silent = true })

--Signature help
-- vim.keymap.set("n", "gs", require("lspsaga.signaturehelp").signature_help, { silent = true,noremap = true})

-- rename
-- vim.keymap.set("n", "gr", require("lspsaga.rename").lsp_rename, { silent = true,noremap = true })

-- Preview Definition
-- vim.keymap.set("n", "gd", require("lspsaga.definition").preview_definition, { silent = true,noremap = true })


-- Jump and show diagnostics
-- vim.keymap.set("n", "<leader>cd", require("lspsaga.diagnostic").show_line_diagnostics, { silent = true,noremap = true })

-- jump diagnostic
-- vim.keymap.set("n", "[e", require("lspsaga.diagnostic").goto_prev, { silent = true, noremap =true })
-- vim.keymap.set("n", "]e", require("lspsaga.diagnostic").goto_next, { silent = true, noremap =true })

-- or jump to error
vim.keymap.set("n", "[E", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true, noremap = true })
vim.keymap.set("n", "]E", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true, noremap = true })
