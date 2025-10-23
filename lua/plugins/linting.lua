return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			go = { "golangcilint" },
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
