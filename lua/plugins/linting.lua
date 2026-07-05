return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			html = { "htmlhint" },
			css = { "stylelint" },
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			svelte = { "eslint_d" },
			go = { "golangcilint" },
			json = { "biomejs" },
		}
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
			group = vim.api.nvim_create_augroup("lint", { clear = true }),
			callback = function()
				local ok, err = pcall(require("lint").try_lint)
				if not ok then
					vim.notify("Linting failed " .. err, vim.log.levels.ERROR)
				end
			end,
		})
	end,
}
