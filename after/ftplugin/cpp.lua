if vim.fn.executable('clangd') == 1 then
    vim.lsp.start({
        name = 'clangd language server',
        cmd = { 'clangd' },
        root_dir = vim.fs.dirname(vim.fs.find({ 'CMakeLists.txt', 'build.zig' }, { upward = true })[1]),
        settings = {},
    })
end
