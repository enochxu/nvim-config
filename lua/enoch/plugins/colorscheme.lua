return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("kanagawa").setup({})
    -- load the colorscheme here
    vim.cmd([[colorscheme kanagawa]])
  end,
}

