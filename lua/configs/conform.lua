local options = {
    formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
        rust = { "rustfmt" },
        go = { "gofmt" },
        zig = { "zigfmt" },
        csharp = { "csharpier" },
        cmake = { "cmake_format" },
        cpp = { "clang_format" },
        c = { "clang_format" },
        gleam = { "gleam" },
        ["*"] = { "typos" },
    },
    format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
    },
}

local conform = require("conform")

conform.setup(options)

vim.keymap.set({ "n", "v" }, "<leader>mp",
    function()
        conform.format({
            lsp_fallback = true,
            async = false,
            timeout_ms = 1000,
        })
    end,
    { desc = "Format file or range (in visual mode)" }
)
