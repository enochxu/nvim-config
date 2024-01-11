return { 
  "neovim/nvim-lspconfig",
  event = { "BufRead", "BufNewFile" },
  config = function()
    local custom_attach = function(client, bufnr)
      -- Mappings.
      local map = function(mode, l, r, opts)
        opts = opts or {}
        opts.silent = true
        opts.buffer = bufnr
        keymap.set(mode, l, r, opts)
      end

      map("n", "gd", vim.lsp.buf.definition, { desc = "go to definition" })
      map("n", "<C-]>", vim.lsp.buf.definition)
      map("n", "K", vim.lsp.buf.hover)
      map("n", "<C-k>", vim.lsp.buf.signature_help)
      map("n", "<space>rn", vim.lsp.buf.rename, { desc = "variable rename" })
      map("n", "gr", vim.lsp.buf.references, { desc = "show references" })
      -- Set some key bindings conditional on server capabilities
      if client.server_capabilities.documentFormattingProvider then
        map("n", "<space>f", vim.lsp.buf.format, { desc = "format code" })
      end
    end

    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lspconfig = require("lspconfig")

    lspconfig.clangd.setup{
      on_attach = custom_attach,
      capabilities = capabilities,
      filetypes = { "c", "cpp", "cc" },
      flags = {
        debounce_text_changes = 500,
      },
    }
  end,
}
