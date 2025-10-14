return {
	"nvim-tree/nvim-tree.lua",
	opts = {
		filters = {
			dotfiles = false,
			git_ignored = false,
		},
	},
	keys = {
		{
			"<leader>e",
			function()
				require("nvim-tree.api").tree.toggle()
			end,
			desc = "Toggle Explorer",
		},
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
}
