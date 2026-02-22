-- ~/.config/nvim/lua/plugins/dadbod.lua
return {
    "tpope/vim-dadbod",
    dependencies = {
        "kristijanhusak/vim-dadbod-ui",
        "kristijanhusak/vim-dadbod-completion",
    },
    config = function()
        vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/db_ui"
        vim.g.db_ui_use_nerd_fonts = 1
        vim.g.db_ui_show_database_icon = 1

        -- Database connections
        vim.g.dbs = {
            tpch1 = "postgresql://huber@localhost:5432/tpch1",
            postgres = "postgresql://huber@localhost:5432/postgres",
        }

        -- Auto-execute on save (optional)
        vim.g.db_ui_auto_execute_table_helpers = 1

        -- Set up SQL completion (if you have nvim-cmp installed)
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "sql", "mysql", "plsql" },
            callback = function()
                local ok, cmp = pcall(require, "cmp")
                if ok then
                    cmp.setup.buffer({
                        sources = {
                            { name = "vim-dadbod-completion" },
                            { name = "buffer" },
                        },
                    })
                end
            end,
        })

        -- Auto-set connection for SQL files in tpch directory
        vim.api.nvim_create_autocmd("BufRead", {
            pattern = { "*/tpch/*.sql", "*/queries/*.sql" },
            callback = function()
                vim.b.db = vim.g.dbs.tpch1
                vim.notify("Database connection set to: tpch1", vim.log.levels.INFO)
            end,
        })

        -- Create custom command to use named connections
        vim.api.nvim_create_user_command("DBSelect", function(opts)
            local db_name = opts.args
            if vim.g.dbs[db_name] then
                vim.b.db = vim.g.dbs[db_name]
                vim.notify("Connected to: " .. db_name, vim.log.levels.INFO)
            else
                vim.notify("Database '" .. db_name .. "' not found in vim.g.dbs", vim.log.levels.ERROR)
            end
        end, {
            nargs = 1,
            complete = function()
                local dbs = {}
                for name, _ in pairs(vim.g.dbs) do
                    table.insert(dbs, name)
                end
                return dbs
            end,
            desc = "Select a database connection by name",
        })
    end,
    keys = {
        { "<leader>db", "<cmd>DBUIToggle<cr>",        desc = "Toggle Database UI" },
        { "<leader>df", "<cmd>DBUIFindBuffer<cr>",    desc = "Find Database Buffer" },
        { "<leader>dr", "<cmd>DBUIRenameBuffer<cr>",  desc = "Rename Database Buffer" },
        { "<leader>dl", "<cmd>DBUILastQueryInfo<cr>", desc = "Last Query Info" },
    },
}
