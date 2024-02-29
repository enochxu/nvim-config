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
    local api = vim.api
    local diagnostic = vim.diagnostic
    
    api.nvim_create_autocmd("CursorHold", {
      buffer = bufnr,
      callback = function()
        local float_opts = {
          focusable = false,
          close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
          border = "rounded",
          source = "always", -- show source in diagnostic popup window
          prefix = " ",
        }

        if not vim.b.diagnostics_pos then
          vim.b.diagnostics_pos = { nil, nil }
        end

        local cursor_pos = api.nvim_win_get_cursor(0)
        if (cursor_pos[1] ~= vim.b.diagnostics_pos[1] or cursor_pos[2] ~= vim.b.diagnostics_pos[2])
            and #diagnostic.get() > 0
        then
          diagnostic.open_float(nil, float_opts)
        end

        vim.b.diagnostics_pos = cursor_pos
      end,
    })
    
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
