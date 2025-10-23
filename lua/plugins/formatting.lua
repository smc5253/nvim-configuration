return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
			lua = { "stylua" },
			go = { "goimports", "gofumpt" },
		})
		vim.keymap.set("n", "<leader>gf", require("conform").format, { desc = "format buffer" })
	end,
}
