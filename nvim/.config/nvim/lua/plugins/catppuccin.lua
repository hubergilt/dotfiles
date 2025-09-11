return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "frappe", -- "latte", "frappe", "macchiato", or "mocha"
				transparent_background = false,
				integrations = {
					treesitter = true,
					native_lsp = { enabled = true },
					cmp = true,
					gitsigns = true,
					telescope = true,
					-- add others you use
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
