local is_ok, key = pcall(require, "which-key")
if not is_ok then
  error("Error cargando wich-key")
  return
end

key.setup {
plugins = {
    marks = false, -- shows a list of your marks on ' and `
    registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- spelling = {
    --   enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
    --   suggestions = 20, -- how many suggestions should be shown in the list?
    -- },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = false, -- default bindings on <c-w>
      nav = false, -- misc bindings to work with windows
      z = false, -- bindings for folds, spelling and others prefixed with z
      g = false, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = '<c-d>', -- binding to scroll down inside the popup
    scroll_up = '<c-u>', -- binding to scroll up inside the popup
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = false, -- show help message on the command line when the popup is visible
  triggers = {"auto"}, -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n",
  prefix = "",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
}

local files = {
  name = "Files",
  f = {"<cmd>lua require('telescope.builtin').find_files( require('telescope.themes').get_dropdown({previewer = false}))<cr>", "Find files"},
  r = {"<cmd>Telescope live_grep<cr>", "Search any world"},
  c = {"<cmd>new<cr>", "Create new file"},
  x = {"<cmd>:quit<cr>", "Close current buffer"},
  s = {"<cmd>:write<cr>", "Write changes"},
  e = {"<cmd>:NvimTreeToggle<cr>", "NvimTree"}
}

local gs = require("gitsigns")

 local git = {
   name = "Git",
   n = {
     function()
       if vim.wo.diff then return ']c' end
       vim.schedule(function() gs.next_hunk() end)
       return '<Ignore>'
     end, "Go to next hunk",
   },
   p = {
     function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
     end, "Go to previous hunk",
   },
   s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage hunk" },
   r = { "<cmd>Gitsigns reset_hunk<cr>", "reset hunk" },
   b = { "<cmd>Gitsigns stage_buffer<cr>", "stage buffer" },
   u = {gs.undo_stage_hunk, "undo stage junk"},
   R = {gs.reset_buffer, "Reset buffer"},
   P = {gs.preview_hunk, "Preview hunk"},
   B = {function() gs.blame_line({full = true}) end, "Blame line"},
   d = {gs.diffthis, "Show diff in the file"},
   v = {"<cmd>GitViewOpen<cr>", "Show diff in any files"},
   c = {"<cmd>GitViewClose<cr>", "Close GitDiff"},
   g = {"<cmd>Neogit kind=tab<cr>", "Close GitDiff"},
 }

 local lsp = {
   name = "Lsp",
   a = {function() require("lspsaga.codeaction").code_action(opts) end, "Code action"},
   f = {require("lspsaga.finder").lsp_finder, "Find definitions and references"},
   o = {require("lspsaga.hover").render_hover_doc, "Show documentation"},
   s = {require("lspsaga.signaturehelp").signature_help, "Show signature and doc"},
   r = {require("lspsaga.rename").lsp_rename, "Rename identifiers"},
   p = {require("lspsaga.definition").preview_definition, "preview definition"},
   d = {require("lspsaga.diagnostic").show_line_diagnostic, "show inline diagnostics"},
   ["[e"] = {require("lspsaga.diagnostic").goto_prev, "Goto previous error"},
   ["]e"] = {require("lspsaga.diagnostic").goto_next, "Goto next error"},
   ["[E"] = {require("lspsaga.diagnostic").goto_prev{severity = vim.diagnostic.severity.ERROR}, "Goto previous error"},
   ["]E"] = {require("lspsaga.diagnostic").goto_next{severity = vim.diagnostic.severity.ERROR}, "Goto previous error"},
 }
-- local db = {}
key.register(files, { prefix = "f"})
key.register(git, { prefix = "g"})
key.register(lsp, {prefix = "c"})


