return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua.with({ filetypes = { "lua" }, timeout_ms = 2000 }),
      },
    })
    vim.keymap.set("n", "gf", vim.lsp.buf.format, { silent = true, desc = "Format" })
  end,
}
