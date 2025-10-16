return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua.with({ filetypes = { "lua" }, timeout_ms = 2000 }),

				-- go
				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.formatting.goimports,
				null_ls.builtins.diagnostics.golangci_lint,
			},
		})
		vim.keymap.set("n", "gf", vim.lsp.buf.format, { silent = true, desc = "Format" })
	end,
}
