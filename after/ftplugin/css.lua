if vim.fn.executable('tailwindcss-language-server') == 1 then
    vim.lsp.start({
        name = 'tailwindcss-language-server',
        cmd = { 'tailwindcss-language-server', '--stdio' },
        root_dir = vim.fs.dirname(vim.fs.find({ 'tailwind.config.*' }, { upward = true })[1]),
        settings = {},
    })
end
