return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
		"dawsers/telescope-floaterm.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				pickers = {
					find_files = {
						hidden = true,
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			local builtin = require("telescope.builtin")
			-- Find files (Ctrl + p)
			vim.keymap.set("n", "<C-p>", builtin.find_files, { noremap = true, silent = true, desc = "Find files" })

			-- Live grep (leader + fg)
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { noremap = true, silent = true, desc = "Live grep" })

			-- Open old files (leader + leader)
			vim.keymap.set(
				"n",
				"<leader><leader>",
				builtin.oldfiles,
				{ noremap = true, silent = true, desc = "Open old files" }
			)

			-- Browse buffers
			vim.keymap.set(
				"n",
				"<leader>fb",
				builtin.buffers,
				{ noremap = true, silent = true, desc = "Browse buffers" }
			)

			-- Search in current buffer
			vim.keymap.set(
				"n",
				"<leader>fs",
				builtin.current_buffer_fuzzy_find,
				{ noremap = true, silent = true, desc = "Search in buffer" }
			)

			-- Search help tags
			vim.keymap.set(
				"n",
				"<leader>fh",
				builtin.help_tags,
				{ noremap = true, silent = true, desc = "Search help tags" }
			)

			-- Search for marks
			vim.keymap.set("n", "<leader>fm", builtin.marks, { noremap = true, silent = true, desc = "Search marks" })

			-- LSP document symbols (leader + ls)
			vim.keymap.set(
				"n",
				"<leader>ls",
				builtin.lsp_document_symbols,
				{ noremap = true, silent = true, desc = "Document symbols" }
			)

			-- Navigate diagnostics
			vim.keymap.set(
				"n",
				"]d",
				vim.diagnostic.goto_next,
				{ noremap = true, silent = true, desc = "Next diagnostic" }
			)
			vim.keymap.set(
				"n",
				"[d",
				vim.diagnostic.goto_prev,
				{ noremap = true, silent = true, desc = "Previous diagnostic" }
			)
			vim.keymap.set(
				"n",
				"<leader>ld",
				vim.diagnostic.open_float,
				{ noremap = true, silent = true, desc = "Line diagnostics" }
			)
			vim.keymap.set(
				"n",
				"<leader>qd",
				vim.diagnostic.setloclist,
				{ noremap = true, silent = true, desc = "Diagnostics in loclist" }
			)

			-- Telescope diagnostics
			local builtin = require("telescope.builtin")
			vim.keymap.set(
				"n",
				"<leader>dd",
				builtin.diagnostics,
				{ noremap = true, silent = true, desc = "Workspace diagnostics" }
			)
			vim.keymap.set("n", "<leader>bd", function()
				builtin.diagnostics({ bufnr = 0 }) -- Current buffer only
			end, { noremap = true, silent = true, desc = "Buffer diagnostics" })

			-- Code actions
			vim.keymap.set(
				"n",
				"<leader>ca",
				vim.lsp.buf.code_action,
				{ noremap = true, silent = true, desc = "Code actions" }
			)

			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("floaterm")
		end,
	},
}
