local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")

-- Set .m files to use MATLAB syntax
vim.filetype.add({
    extension = {
        m = "matlab",
    },
})

require("nvim-treesitter.configs").setup({
    highlight = {
        enable = true,
    },
})

-- Set .m files to use MATLAB syntax
vim.filetype.add({
    extension = {
        m = "matlab",
    },
})

require("nvim-treesitter.configs").setup({
    highlight = {
        enable = true,
    },
})
