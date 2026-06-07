return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },

	version = "1.*",

	opts = {
		-- 1. Customizing the super-tab mapping to fix Emmet/Snippet navigation
		keymap = {
			preset = "none", -- Clear preset to prevent conflicts

			["<CR>"] = { "accept", "fallback" },

			["<Tab>"] = {
				function(cmp)
					-- Prioritize jumping to the next Emmet placeholder/div first
					if cmp.is_snippet_active() then
						return cmp.snippet_forward()
					elseif cmp.is_visible() then
						return cmp.select_next()
					end
				end,
				"fallback",
			},
			["<S-Tab>"] = {
				function(cmp)
					-- Prioritize jumping back a placeholder/div first
					if cmp.is_snippet_active() then
						return cmp.snippet_backward()
					elseif cmp.is_visible() then
						return cmp.select_prev()
					end
				end,
				"fallback",
			},

			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },
			["<C-e>"] = { "hide", "fallback" },
		},

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = { documentation = { auto_show = true } },

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
