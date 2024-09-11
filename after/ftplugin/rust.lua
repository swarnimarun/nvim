if vim.fn.executable('rust-analyzer') == 1 then
    vim.lsp.start({
        name = 'Rust Analyzer',
        cmd = { 'rust-analyzer' },
        root_dir = vim.fs.dirname(vim.fs.find({ 'Cargo.toml' }, { upward = true })[1]),
    })
end
