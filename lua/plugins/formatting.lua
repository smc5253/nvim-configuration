return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				svelte = { "prettierd" },
				css = { "prettierd" },
				html = { "prettierd" },
				json = { "prettierd" },
				yaml = { "prettierd" },
				markdown = { "prettierd" },
				lua = { "stylua" },
				go = { "goimports", "gofumpt" },
			},
		})
		local function formatBuffer()
			local bufnr = vim.api.nvim_get_current_buf()
			conform.format({ bufnr = bufnr })
		end
		vim.keymap.set("n", "<leader>gf", formatBuffer, { desc = "format buffer" })
	end,
}
