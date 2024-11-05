vim.cmd("let mapleader =' ' ")
require("preferences")
require("keymaps")


-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    ui = {

        border = "rounded",
    },

    install = {
        colorscheme = { "monokai-pro-octagon" },
    },
    spec = {

        { import = "plugins" },
    },
})

-- Theme
vim.cmd("colorscheme tokyonight-night")

-- Set conceallevel to 2 to fully conceal Markdown tags
vim.cmd([[
    autocmd FileType markdown setlocal conceallevel=2
    autocmd FileType markdown setlocal concealcursor=n
]])
