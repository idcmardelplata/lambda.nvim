return {
  "kylechui/nvim-surround",
  -- lazy = true,
  config = function()
    local surround = require("nvim-surround")
    surround.setup {
      highlight = { -- Disables highlights
      duration = false,
    },
  }
  end
}
