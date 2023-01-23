return {
  'phaazon/mind.nvim',
  lazy = true,
  branch = 'v2.2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require 'mind'.setup()
  end,
  cmd = {"MindClose", "MindOpenMain", "MindOpenProject","MindOpenSmartProject", "MindReloadState" }
}
