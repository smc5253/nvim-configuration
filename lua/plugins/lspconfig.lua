return {
  "neovim/nvim-lspconfig",
  config = function() 
    local on_attach = function()
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })
      vim.keymap.set("n", "gh",vim.lsp.buf.hover, {buffer = bufnr, desc = "Go to hover"})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {buffer = bufnr, desc = "Rename symbol"})
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer = bufnr, desc = "Go to implementation"})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer = bufnr, desc = "Go to references"})
      vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer = bufnr, desc = "Go to type definition"})
    end

    vim.lsp.config.clangd = {
      cmd = {
        'clangd',
        '--clang-tidy',
        '--background-index',
        '--offset-encoding=utf-8',
      },
      filetypes = { 'c', 'cpp' },
    }

    vim.lsp.enable({
      "clangd",
    })
  end,
}
