return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  build = ":TSUpdate",
  opts = {
    "c", "cpp", "python"
  },
  config ={
    ensure_installed = { "python", "cpp", "lua", "vim", "json", "toml" },
    ignore_install = {}, -- List of parsers to ignore installing
    highlight = {
      enable = true, -- false will disable the whole extension
      disable = { 'help' }, -- list of language that will be disabled
    },
  }
}
