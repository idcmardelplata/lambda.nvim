return {
  'junegunn/fzf',
  lazy = true,
  ft = 'qf',
  build = function ()
    vim.fn['fzf#install']()
  end
}
