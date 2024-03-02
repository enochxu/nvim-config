return {
  "sbdchd/neoformat",
  { "SirVer/ultisnips", dependencies = {
    "honza/vim-snippets",
  }, event = "InsertEnter" },
  { "nvim-zh/better-escape.vim", event = { "InsertEnter" } },
  { "tpope/vim-commentary", event = "VeryLazy" }
}
