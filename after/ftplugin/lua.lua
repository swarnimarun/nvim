if vim.fn.executable('lua-language-server') == 1 then
    vim.lsp.start({
        name = 'LuaLS',
        cmd = { 'lua-language-server' },
        root_dir = vim.fs.dirname(vim.fs.find({ 'init.lua', '*.lua' }, { upward = true })[1]),
        settings = {
            Lua = {
                runtime = {
                    version = "LuaJIT",
                    pathStrict = true,
                    path = {
                        "lua/?.lua",
                    },
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false,
                },
            },
        },
    })
end
