return  {
  "folke/which-key.nvim",
  commit = "bd4411a2ed4dd8bb69c125e339d837028a6eea71",
  config = function()
    local key = require("which-key")
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
          z = true, -- bindings for folds, spelling and others prefixed with z
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
      triggers = "auto", -- automatically setup triggers
      -- triggers = {"<leader>"} -- or specify a list manually
      triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
      },
    }


-- local opts = {
--   mode = "n",
--   prefix = "",
--   buffer = nil,
--   silent = true,
--   noremap = true,
--   nowait = false,
-- }

local files = {
  name = "Files",
  n = {"<cmd>:enew<cr>", "create new file"},
  h = {"<cmd>new<cr>", "create new buffer in horizontal"},
  v = {"<cmd>:vnew<cr>", "create new buffer in vertical"},
  f = {"<cmd>lua require('telescope.builtin').find_files( require('telescope.themes').get_dropdown({previewer = false}), {hidden = true})<cr>", "find files"},
  g = {"<cmd>Telescope live_grep<cr>", "search any world"},
  x = {"<cmd>:quit<cr>", "close current buffer"},
  s = {"<cmd>:write<cr>", "write changes"},
  e = {"<cmd>:NvimTreeToggle<cr>", "show tree"},
}


local signs = require("gitsigns")

 local git = {
   name = "Git",
   n = {
     function()
       if vim.wo.diff then return ']c' end
       vim.schedule(function() signs.next_hunk() end)
       return '<Ignore>'
     end, "go to next hunk",
   },
   p = {
     function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() signs.prev_hunk() end)
      return '<Ignore>'
     end, "go to previous hunk",
   },
   s = {signs.stage_hunk, "stage hunk" },
   r = {signs.reset_hunk, "reset hunk" },
   b = {signs.stage_buffer, "stage buffer" },
   u = {signs.undo_stage_hunk, "undo stage junk"},
   R = {signs.reset_buffer, "reset buffer"},
   P = {signs.preview_hunk, "preview hunk"},
   B = {function() signs.blame_line({full = true}) end, "blame line"},
   d = {signs.diffthis, "show diff in the file"},
   v = {"<cmd>DiffviewOpen<cr>", "show diff in any files"},
   c = {"<cmd>DiffviewClose<cr>", "close gitdiff"},
   g = {"<cmd>Neogit kind=tab<cr>", "Git management"},
 }

 local todo = {
   name = "Todo Comments",
   l = {"<cmd>TodoLocList<cr>", "Todo location list"},
   q = {"<cmd>TodoQuickFix<cr>", "Todo quickfix"},
   t = {"<cmd>TodoTelescope<cr>", "Todo telescope"},
   u = {"<cmd>TodoTrouble<cr>", "Todo trouble"},
 }

 -- TODO: Fix [e and ]e shortcuts
 local lsp = {
   name = "Lsp",
   a = {vim.lsp.buf.code_action, "code action"},
   f = {"<cmd>Telescope lsp_references<cr>", "find references"},
   d = {"<cmd>Telescope lsp_type_definitions<cr>", "type definitions"},
   p = {"<cmd>Telescope lsp_definitions<cr>", "show definition"},
   s = {"<cmd>Telescope lsp_document_symbols<cr>", "show symbols"},
   w = {"<cmd>Telescope lsp_workspace_symbols<cr>", "show symbols in workspace"},
   D = {"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "dynamic symbols"},
   i = {"<cmd>Telescope lsp_implementations<cr>", "implementations"},
   e = {"<cmd>Lspsaga show_line_diagnostics<cr>", "show inline diagnostic"},
   t = {"<cmd>TroubleToggle<cr>", "Diagnostics"},
   r = {vim.lsp.buf.rename, "Rename"},
   -- e = {require("lspsaga.diagnostic").show_line_diagnostics, "show inline diagnostics"},


   --o = {require("lspsaga.hover").render_hover_doc, "show documentation"},
   -- s = {vim.lsp.buf.signature_help, "show signature and doc."},
   -- r = {require("lspsaga.rename").lsp_rename, "rename identifiers"},
   --p = {require("lspsaga.definition").preview_definition, "preview definition"},
   -- d = {require("lspsaga.diagnostic").show_line_diagnostics, "show inline diagnostics"},
   -- ["[e"] = {require("lspsaga.diagnostic").goto_prev, "goto previous error"},
   -- ["]e"] = {require("lspsaga.diagnostic").goto_next, "goto next error"},
   -- ["[E"] = {require("lspsaga.diagnostic").goto_prev{severity = vim.diagnostic.severity.ERROR}, "goto previous error"},
   -- ["]E"] = {require("lspsaga.diagnostic").goto_next{severity = vim.diagnostic.severity.ERROR}, "goto previous error"},
 }


 local octo = {
   name = "Github",
   i = {
     name = "issues",
     c = { "<cmd>:Octo issue close<cr>", "close issue" },
     r = { "<cmd>:Octo issue reopen<cr>", "reopen issue" },
     R = { "<cmd>:Octo issue reload<cr>", "reload issue" },
     e = { "<cmd>:Octo issue edit", "edit issue" },
     l = { "<cmd>:Octo issue list<cr>", "list issues" },
     s = { "<cmd>:Octo issue search<cr>", "search issues" },
     b = { "<cmd>:Octo issue browser<cr>", "issues browser" },
     u = { "<cmd>:Octo issue url<cr>", "copy url of issue" },
   },
   p = {
     name = "pull requests",
     l = {"<cmd>:Octo pr list<cr>", "List all prs"},
     s = {"<cmd>:Octo pr search<cr>", "search prs"},
     r = {"<cmd>:Octo pr reopen<cr>", "reopen current pr"},
     c = {"<cmd>:Octo pr create<cr>", "create pr from the current branch"},
     C = {"<cmd>:Octo pr close<cr>", "close current pr"},
     S = {"<cmd>:Octo pr checkout<cr>", "checkout pr"},
     L = {"<cmd>:Octo pr commits<cr>", "list all pr commits"},
     D = {"<cmd>:Octo pr changes<cr>", "Show all pr changes"},
     R = {"<cmd>:Octo pr ready<cr>", "Mark a draft pr for review"},
     I = {"<cmd>:Octo pr status<cr>", "Show status of checks in the pr"},
   },
   r = {
     name = "repo",
     l = {"<cmd>:Octo repo list<cr>", "List own repositories"},
   },
   g = {
     name = "gist",
     l = {"<cmd>:Octo gist list<cr>", "List gist"},
   },
   c = {
     name = "comment",
     a = {"<cmd>:Octo comment add<cr>", "add comment"},
     d = {"<cmd>:Octo comment delete<cr>", "delete comment"},
   }
 }


 local harpoon = {
   name = "Harpoon",
   m = {require('harpoon.mark').add_file, "mark file"},
   o = {require("harpoon.ui").toggle_quick_menu, "open marks"},
   n = {require("harpoon.ui").nav_next, "next mark"},
   p = {require("harpoon.ui").nav_prev, "prev mark"},
   t = { function() require("harpoon.tmux").gotoTerminal(1) end, "go to first tmux terminal"}
 }


 local packer = {
   name = "Packer",
   s = {"<cmd>:PackerSync<cr>", "sync plugins"},
   c = {"<cmd>:PackerClean<cr>", "clean plugins"},
   i = {"<cmd>:PackerInstall<cr>", "install plugins"},
   l = {"<cmd>:PackerLoad ", "load plugin"},
   S = {"<cmd>:PackerStatus<cr>", "plugins status"},
 }

 local markown = {
   name = "Markdow",
   p = {"<cmd>:Glow<cr>", "Preview in neovim"},
   P = {"<cmd>:MarkdownPreview<cr>", "preview in the browser"}
 }

 local rust = {
   name = "Rust",
   r = {"<cmd>RustRun<cr>", "Cargo run"},
   a = {"<cmd>RustEmitAsm<cr>", "Show the asm code"},
   f = {"<cmd>:!cargo fmt<cr>", "format the code"},
   -- c = {require("rust-tools.open_cargo_toml").open_cargo_toml, "Open cargo.toml"},
 }

 local terminal = {
   name = "Terminal",
   v = {"<cmd>:vsplit | term<cr>", "open terminal in vertical"},
   s = {"<cmd>:split | term<cr>", "open terminal in horizontal"},
   f = {"<cmd>:term<cr>", "open terminal in full"},
 }


-- local db = {}
local telescope = {
  name = "Telescope",
  e = {"<cmd>:Telescope emoji<cr>", "find emojis"},
  m = {"<cmd>:Telescope media_files<cr>", "find images"},
  c = {"<cmd>:Telescope commands<cr>", "show commands"},
  h = {"<cmd>:Telescope command_history<cr>", "command history"},
  d = {"<cmd>:Telescope diagnostics<cr>", "show diagnostics"},
  s = {"<cmd>:Telescope lsp_workspace_symbols<cr>", "show symbols"},
  r = {"<cmd>:Telescope lsp_references<cr>", "show references"},
  q = {"<cmd>:Telescope quickfix<cr>", "show quickfix"},
  g = {"<cmd>:Telescope grep_string<cr>", "grep strings"},
  l = {"<cmd>:Telescope live_grep<cr>", "live grep"},
  R = {"<cmd>:Telescope oldfiles<cr>", "recent files"},
  o = {"<cmd>:lua vim.lsp.buf.hover()<cr>", "display information"},

}

local neotest = {
  name = "Neotest",
  t = {"<cmd>:lua require('neotest').run.run()<cr>", "run test"},
  f = {"<cmd>:lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "run test file"},
  d = {"<cmd>:lua require('neotest').run.stop()<cr>", "stop current test"},
  a = {"<cmd>:lua require('neotest').run.attach()<cr>", "attach to the last test" },
  s = {"<cmd>:lua require('neotest').summary.toggle()<cr>", "Open tests summary" },
  p = {"<cmd>:lua require('neotest').output_panel.toggle()<cr>", "stream all output" },
  o = {"<cmd>:lua require('neotest').output.open({enter=true})<cr>", "stream all output" },
  n = {"<cmd>:lua require('neotest').jump.next({status = 'failed'})<cr>", "jump next failed test" },
  N = {"<cmd>:lua require('neotest').jump.prev({status = 'failed'})<cr>", "jump prev failed test" },

}

local database = {
  name = "Database",
  c = {"<cmd>DBUIAddConnection<CR>", "create new connection"},
  t = {"<cmd>DBUIToggle<CR>", "Toggle DBUI"},
  l = {"<cmd>DBUILastQueryInfo<CR>", "Last query info"},
}

local window_options = {
  name = "window",
  q = {"<cmd>:quit<cr>", "close window"}
}

local mind = {
  name = "mind",
   o = {"<cmd>:MindOpenMain<cr>", "Open mind"},
   c = {"<cmd>:MindClose<cr>", "Close mind"},
   p = {"<cmd>:MindOpenProject<cr>", "Open Project"},
   s = {"<cmd>:MindOpenSmartProject<cr>", "Open smart Project"},
   r = {"<cmd>:MindReloadState<cr>", "Reload state"}
}

local notes = {
  name = "Notes",
  b = {"<cmd>:lua  require('telekasten').browse_media()<cr>", "Browse Media Files"},
  B = {"<cmd>:lua  require('telekasten').show_backlinks()<cr>", "Show Backlinks"},
  c = {'<cmd>Telekasten show_calendar<cr>', "Calendar"},
  d = {'<cmd>vsplit || Telekasten goto_today<cr>', "Daily"},
  D = {'<cmd>Telekasten find_daily_notes<cr>', "Find dailies"},
  f = {'<cmd>Telekasten find_notes<cr>', "Find notes"},
  F = {'<cmd>Telekasten follow_link<cr>', "Follow Link"},
  g = {'<cmd>Telekasten search_notes<cr>', "Search string in notes"},
  i = {'<cmd>Telekasten insert_link<cr>', "Insert Link"},
  I = {'<cmd>Telekasten insert_img_link<cr>', "Insert image Link"},
  J = {"<cmd>put =strftime('%F')<cr>", "Insert Date"},
  j = {"<cmd>put =strftime('%a %d %b %r')<cr>", "Insert human Date"},
  K = {"<cmd>put =strftime('%F-%H-%M')<cr>", "Insert time"},
  k = {"<cmd>put =strftime('%r')<cr>", "Insert human time"},
  t = {"<cmd>Telekasten show_tags<cr>", "Tags"},
  T = {"<cmd>Telescope live_grep cwd=$NOTES_ROOT <cr>", "Search notes"},
  n = {"<cmd>Telekasten new_note<cr>", "New note"},
  N = {"<cmd>execute 'e '.strftime(\"%F\").'md'<cr>", "New note here"},
  o = {"<cmd>vsplit $NOTES_ROOT/<cr>", "Open Notes"},
  p = {"<cmd>Telekasten<cr>", "Telekasten"},
  s = {"<cmd>:lua require('telekasten').find_friends<cr>", "Find Friends"},


  r = {"<cmd>:lua  require('telekasten').rename_note", "Rename Note"},
  w = {"<cmd>Telekasten goto_thisweek<cr>", "Weekly"},
  W = {"<cmd>Telekasten find_weekly_notes<cr>", "Find Weeklies"},
  v = {"<cmd>MarkdownPreviewToggle<cr>", "Preview"},
  x = {"<cmd>Telekasten toggle_todo<cr>", "Toggle Todo"},
  y = {"<cmd>Telekasten yank_notelink<cr>", "Copy note link"},
  z = {"<cmd>execute 'vsplit $NOTES_ROOT/notes/draft/'.strftime(\"%F-%H%M\").'.md' <cr>", "New zettelkasten"},
  Z = {"<cmd>execute 'e '.strftime(\"%F-%H-%M\").'.md' <cr>", "New zettelkasten here"},

}


key.register(files, { prefix = "<leader>f"})
key.register(git, { prefix = "<leader>g"})
key.register(octo, { prefix = "<leader>h"})
key.register(lsp, {prefix = "<leader>l"})
key.register(harpoon, {prefix = "<leader>m"})
key.register(packer, {prefix = "<leader>p"})
key.register(markown, {prefix = "<leader>M"})
key.register(terminal, {prefix = "<C-t>"});
key.register(rust, {prefix = "<leader>r"})
key.register(telescope, {prefix = "<leader>T"})
key.register(neotest, {prefix = "<leader>t"})
key.register(database, {prefix = "<leader>d"})
key.register(window_options, {prefix = "<leader>q"})
key.register(mind, {prefix = "<leader>P"})
key.register(todo, {prefix = "<leader>o"})
key.register(notes, {prefix = "<leader>n"})



  end
}



