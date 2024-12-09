-- first case is for windows
if vim.fn.executable('svelteserver.cmd') == 1 then
    vim.lsp.start({
        name = 'Svelte Language Server',
        cmd = { 'svelteserver.cmd', '--stdio' },
        root_dir = vim.fs.dirname(vim.fs.find({ 'svelte.config.js', 'svelte.config.ts', 'package.json' }, { upward = true })[1]),
    })
-- for linux cmd should not exist on linux/mac
elseif vim.fn.executable('svelteserver') == 1 then
    vim.lsp.start({
        name = 'Svelte Language Server',
        cmd = { 'svelteserver', '--stdio' },
        root_dir = vim.fs.dirname(vim.fs.find({ 'svelte.config.js', 'svelte.config.ts', 'package.json' }, { upward = true })[1]),
    })
end
