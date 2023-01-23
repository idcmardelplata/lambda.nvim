return {
  'glepnir/dashboard-nvim',
   event = 'VimEnter',
  config = function()
    local config = {
      theme = 'doom',
      config = {
        header = {
          '⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⣤⣴⣦⣤⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ',
          '⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⣿⠿⠿⠿⠿⣿⣿⣿⣿⣶⣤⡀⠀⠀⠀⠀⠀⠀ ',
          '⠀⠀⠀⠀⣠⣾⣿⣿⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢿⣿⣿⣶⡀⠀⠀⠀⠀ ',
          '⠀⠀⠀⣴⣿⣿⠟⠁⠀⠀⠀⣶⣶⣶⣶⡆⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣦⠀⠀⠀ ',
          '⠀⠀⣼⣿⣿⠋⠀⠀⠀⠀⠀⠛⠛⢻⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣧⠀⠀ ',
          '⠀⢸⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⡇⠀ ',
          '⠀⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀ ',
          '⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⡟⢹⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⣹⣿⣿⠀ ',
          '⠀⣿⣿⣷⠀⠀⠀⠀⠀⠀⣰⣿⣿⠏⠀⠀⢻⣿⣿⡄⠀⠀⠀⠀⠀⠀⣿⣿⡿⠀ ',
          '⠀⢸⣿⣿⡆⠀⠀⠀⠀⣴⣿⡿⠃⠀⠀⠀⠈⢿⣿⣷⣤⣤⡆⠀⠀⣰⣿⣿⠇⠀ ',
          '⠀⠀⢻⣿⣿⣄⠀⠀⠾⠿⠿⠁⠀⠀⠀⠀⠀⠘⣿⣿⡿⠿⠛⠀⣰⣿⣿⡟⠀⠀ ',
          '⠀⠀⠀⠻⣿⣿⣧⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⠏⠀⠀⠀ ',
          '⠀⠀⠀⠀⠈⠻⣿⣿⣷⣤⣄⡀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⠟⠁⠀⠀⠀⠀ ',
          '⠀⠀⠀⠀⠀⠀⠈⠛⠿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⠁⠀⠀⠀⠀⠀⠀ ',
          '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⠛⠛⠛⠛⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ '
        },
        center  = {
         {
          icon = '🌑',
          icon_hl = 'group',
          desc = 'find files',
          desc_hl = 'group',
          key = 'SPC ff',
          key_hl = 'WildMenu',
          action = 'Telescope find_files',
        },
        {
          icon = '🌑',
          icon_hl = 'group',
          desc = 'recent files',
          desc_hl = 'group',
          key = 'SPC TR',
          key_hl = 'group',
          action = 'Telescope oldfiles',
        },
        {
          icon = '🌑',
          icon_hl = 'group',
          desc = 'new vertical file',
          desc_hl = 'group',
          key = 'SPC fv',
          key_hl = 'group',
          action = '<cmd>vsplit<cr>',
        },
        {
          icon = '🌑',
          icon_hl = 'group',
          desc = 'new horizontal file',
          desc_hl = 'group',
          key = 'SPC fh',
          key_hl = 'group',
          action = '<cmd>split',
        }
        },
        packages = { enable = true },
        project = { limit = 8, action = 'Telescope find_files cwd='},
        mru = {limit = 10}
      }
    }
    local db = require("dashboard")
    -- db.custom_header = 
    --   db.custom_center  = {
    --     {icon = '  ', desc = 'Create new file                         ',
    --     action =  'DashboardNewFile',
    --     shortcut = 'SPC f n'},
    --     {icon = '  ',
    --     desc = 'Find  Files                              ',
    --     action = 'Telescope find_files find_command=rg,--hidden,--files',
    --     shortcut = 'SPC f  '},
    --     {icon = '   ',
    --     desc = 'Find  word                              ',
    --     action = 'Telescope live_grep',
    --     shortcut = 'Ctrl + t '},
    --     -- {icon = '  ',
    --     -- desc = 'Open Personal dotfiles                  ',
    --     -- action = 'Telescope dotfiles path=' .. home ..'/.dotfiles',
    --     -- shortcut = 'SPC f d'},
    --   }

    db.setup(config)

  end
}







-- db.custom_footer  -- type can be nil,table or function(must be return table in function)
-- db.preview_file_Path    -- string or function type that mean in function you can dynamic generate height width
-- db.preview_file_height  -- number type
-- db.preview_file_width   -- number type
-- db.preview_command      -- string type (can be ueberzug which only work in linux)
-- db.confirm_key          -- string type key that do confirm in center select
-- db.hide_statusline      -- boolean default is true.it will hide statusline in dashboard buffer and auto open in other buffer
-- db.hide_tabline         -- boolean default is true.it will hide tabline in dashboard buffer and auto open in other buffer
-- db.session_directory    -- string type the directory to store the session file
-- db.header_pad           -- number type default is 1
-- db.center_pad           -- number type default is 1
-- db.footer_pad           -- number type default is 1
