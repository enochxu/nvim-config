require("enoch.core")
require("enoch.lazy")

local path = vim.fn.stdpath("config") .. "/ginit.vim"
local source_cmd = "source " .. path

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- disable virtual text
    virtual_text = false,

    -- show signs
    signs = true,

    -- delay update diagnostics
    update_in_insert = false,
  }
)

vim.cmd(source_cmd)
