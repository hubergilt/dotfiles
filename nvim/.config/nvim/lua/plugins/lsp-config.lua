return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = false,
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"rust_analyzer",
					"jdtls",
					"tailwindcss",
					"pyright",
					"matlab_ls",
					"solargraph",
				},
				-- This handles automatic setup for servers
				handlers = {
					function(server_name)
						-- Skip servers that have custom handlers below
						local servers_with_custom_setup = {
							"pyright",
							"rust_analyzer",
							"tailwindcss",
							"ts_ls",
							"lua_ls",
							"solargraph",
							"html",
							"clangd",
							"matlab_ls",
						}

						-- Only auto-setup if not in the custom list
						if not vim.tbl_contains(servers_with_custom_setup, server_name) then
							require("lspconfig")[server_name].setup({})
						end
					end,
				},
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"stylua",
					"prettier",
					"erb-lint",
					"rubocop",
					"java-debug-adapter",
					"java-test",
					"html-lsp",
					"clang-format",
					"clangd",
					"xmlformatter",
					"rustfmt",
					"black",
					"isort",
					"autopep8",
					"mypy",
				},
			})
			vim.api.nvim_command("MasonToolsInstall")
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		config = function()
			require("mason-nvim-dap").setup({
				ensure_installed = {
					"python",
					"delve",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Detect the virtual environment dynamically:
			local venv_path = tostring(vim.fn.getenv("VIRTUAL_ENV") or "")
			local python_path = venv_path ~= "" and (venv_path .. "/bin/python") or "python"

			-- Use the new vim.lsp.config API (Neovim 0.11+)
			vim.lsp.enable({
				"tailwindcss",
				"ts_ls",
				"solargraph",
				"html",
				"lua_ls",
				"clangd",
				"rust_analyzer",
				"pyright",
				"matlab_ls",
			})

			-- Custom configurations for specific servers
			vim.lsp.config["rust_analyzer"] = {
				capabilities = capabilities,
				filetypes = { "rust" },
				root_markers = { "Cargo.toml" },
				settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
						},
					},
				},
			}

			vim.lsp.config["pyright"] = {
				capabilities = capabilities,
				settings = {
					python = {
						--pythonPath = python_path,
						analysis = {
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
							diagnosticMode = "workspace",
						},
					},
				},
			}

			vim.lsp.config["tailwindcss"] = {
				capabilities = capabilities,
			}

			vim.lsp.config["ts_ls"] = {
				capabilities = capabilities,
			}

			vim.lsp.config["solargraph"] = {
				capabilities = capabilities,
			}

			vim.lsp.config["html"] = {
				capabilities = capabilities,
			}

			vim.lsp.config["lua_ls"] = {
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = { globals = { "vim" } },
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = { enable = false },
					},
				},
			}

			vim.lsp.config["clangd"] = {
				capabilities = capabilities,
			}

			vim.lsp.config["matlab_ls"] = {
				filetypes = { "matlab", "octave" },
				single_file_support = true,
			}

			-- Keymaps (LspAttach autocommand)
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
				end,
			})
		end,
	},
}
