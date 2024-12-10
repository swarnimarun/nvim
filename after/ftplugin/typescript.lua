if vim.fn.executable('typescript-language-server') == 1 then
    vim.lsp.start({
        name = 'TypeScript Language Server',
        cmd = { 'typescript-language-server', '--stdio' },
        root_dir = vim.fs.dirname(vim.fs.find({ 'tsconfig.json', 'package.json' },
            { upward = true })[1]),
        settings = {
            typescript = {
                inlayHints = {
                    parameterNames = { enabled = "all" },
                    parameterTypes = { enabled = true },
                    variableTypes = { enabled = true },
                    propertyDeclarationTypes = { enabled = true },
                    functionLikeReturnTypes = { enabled = false },
                    enumMemberValues = { enabled = true },
                },
            },
        },
    })
end
