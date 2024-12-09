if vim.fn.executable('csharp-ls') == 1 then
    vim.lsp.start({
        name = 'csharp-ls',
        cmd = { 'csharp-ls' },
        root_dir = vim.fs.dirname(vim.fs.find({ '*.csproj', '.git', '*.sln' }, { upward = true })[1]),
        settings = {},
    })
end
