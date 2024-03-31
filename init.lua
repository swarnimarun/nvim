if vim.g.vscode then
    local map = vim.keymap.set
    local vscode = require("vscode-neovim")

    map("n", "<C-j>", function()
        vscode.call("workbench.action.navigateDown")
    end, { silent = true })
    map("n", "<C-k>", function()
        vscode.call("workbench.action.navigateUp")
    end, { silent = true })
    map("n", "<C-h>", function()
        vscode.call("workbench.action.navigateLeft")
    end, { silent = true })
    map("n", "<C-l>", function()
        vscode.call("workbench.action.navigateRight")
    end, { silent = true })

    map({ "n", "v" }, "gr", function()
        vscode.call("editor.action.goToReferences")
    end, { silent = true })
    map({ "n", "v" }, "gi", function()
        vscode.call("editor.action.goToImplementation")
    end, { silent = true })
    map({ "n", "v" }, "gD", function()
        vscode.call("editor.action.revealDefinition")
    end, { silent = true })
    map({ "n", "v" }, "gd", function()
        vscode.call("editor.action.goToDeclaration")
    end, { silent = true })
    map({ "n", "v" }, "gt", function()
        vscode.call("editor.action.goToTypeDefinition")
    end, { silent = true })

    map({ "n", "v" }, "<Space>w", function()
        vscode.call("whichkey.show")
    end, { silent = true })
    map({ "n", "v" }, "<Space>a", function()
        vscode.call("editor.action.codeAction")
    end, { silent = true })
    map({ "n", "v" }, "<Space>r", function()
        vscode.call("editor.action.rename")
    end, { silent = true })
    map({ "n", "v" }, "<Space>R", function()
        vscode.call("workbench.action.reloadWindow")
    end, { silent = true })

    map("n", "mim", "vi(")
    map("n", "miM", "vi{")
    map("n", "gh", "g0")
    map("n", "gl", "g$")
end

vim.g.base46_cache = vim.fn.stdpath("data") .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require("configs.lazy")

-- load plugins
require("lazy").setup({
    {
        "NvChad/NvChad",
        lazy = false,
        branch = "v2.5",
        import = "nvchad.plugins",
        cond = not vim.g.vscode,
        config = function()
            require("options")
        end,
    },

    { import = "plugins" },
}, lazy_config)

-- load theme
if not vim.g.vscode then
    dofile(vim.g.base46_cache .. "defaults")
    dofile(vim.g.base46_cache .. "statusline")

    require("nvchad.autocmds")

    vim.schedule(function()
        require("mappings")
    end)
end
