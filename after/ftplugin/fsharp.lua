if vim.fn.executable('lua-language-server') == 1 then
    vim.lsp.start({
        name = 'fsautocomplete',
        cmd = { 'fsautocomplete' },
        root_dir = vim.fs.dirname(vim.fs.find({ '*.fsproj', '*.fs', '*.fsi', '*.fsx' }, { upward = true })[1]),
        settings = {},
    })
end
