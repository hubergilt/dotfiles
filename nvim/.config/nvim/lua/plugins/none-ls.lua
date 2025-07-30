return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        local null_ls = require("null-ls")

        local function clean_file()
            -- Replace non-breaking spaces with regular spaces (silently)
            vim.cmd([[silent! %s/\%u00A0/ /g]])

            -- Remove trailing spaces (silently)
            vim.cmd([[silent! %s/\s\+$//e]])
        end

        null_ls.setup({
            -- you can reuse a shared lspconfig on_attach callback here
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                            -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                            --  vim.lsp.buf.format({ async = false })
                            clean_file()     -- Clean up the file
                            vim.lsp.buf.format({ async = false }) -- Format the file
                        end,
                    })
                end
            end,

            sources = {
                null_ls.builtins.diagnostics.erb_lint,
                null_ls.builtins.diagnostics.rubocop,
                null_ls.builtins.diagnostics.trail_space, -- Highlight trailing spaces
                --null_ls.builtins.diagnostics.mypy,
                --null_ls.builtins.diagnostics.pylint,
                null_ls.builtins.formatting.rubocop,
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.clang_format,
                null_ls.builtins.formatting.xmlformat,
                null_ls.builtins.formatting.rustfmt,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
                null_ls.builtins.formatting.autopep8,          -- Use autopep8 for formatting
                null_ls.builtins.code_actions.refactoring.trim_whitespace, -- Remove trailing spaces
            },
        })

        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}
