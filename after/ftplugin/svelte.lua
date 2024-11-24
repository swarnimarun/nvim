if vim.fn.executable('svelteserver') == 1 then
    vim.lsp.start({
        name = 'Svelte Language Server',
        cmd = { 'svelteserver', '--stdio' },
        root_dir = vim.fs.dirname(vim.fs.find({ 'svelte.config.js', 'svelte.config.ts', 'package.json' }, { upward = true })[1]),
    })
end
