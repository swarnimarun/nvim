if vim.fn.executable('zls') == 1 then
    vim.lsp.start({
        name = 'Zig LSP',
        cmd = { 'zls' },
        root_dir = vim.fs.dirname(vim.fs.find({ 'build.zig' }, { upward = true })[1]),
    })
end
