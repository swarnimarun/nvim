if vim.fn.executable('gopls') == 1 then
    vim.lsp.start({
        name = 'gopls',
        cmd = { 'gopls' },
        root_dir = vim.fs.dirname(vim.fs.find({ 'go.mod' }, { upward = true })[1]),
        settings = {
            gopls = {
                hints = {
                    assignVariableTypes = true,
                    compositeLiteralFiles = true,
                    compositeLiteralTypes = true,
                    constantValues = true,
                    functionTypeParameters = true,
                    parameterNames = true,
                    rangeVariableTypes = true,
                }
            }
        },
    })
end
