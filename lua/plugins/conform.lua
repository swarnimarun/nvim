return {
    "stevearc/conform.nvim",
    cond = not vim.g.vscode,
    lazy = true,
    event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
    config = function()
        require("configs.conform")
    end,
}
