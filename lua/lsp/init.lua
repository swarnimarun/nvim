-- local on_attach = function(client, bufnr)
--     local opts = { noremap = true, silent = true }
--     -- set keybinds for the entire buffer
--     opts.buffer = bufnr
--     vim.lsp.inlay_hint.enable(true)
--
--     opts.desc = "Go to declaration"
--     vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
--     opts.desc = "Show LSP definitions"
--     vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
--     opts.desc = "Show documentation for what is under cursor"
--     vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
--     opts.desc = "Show LSP implementations"
--     vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
--
--     opts.desc = "Show signature help"
--     vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
--
--     opts.desc = "Add lsp workspace folder"
--     vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
--
--     opts.desc = "Remove lsp workspace folder"
--     vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
--
--     opts.desc = "List lsp workspace folders"
--     vim.keymap.set("n", "<space>wl", function()
--         print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--     end, opts)
--
--     opts.desc = "Show LSP type definitions"
--     vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
--
--     opts.desc = "Smart rename"
--     vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
--
--     opts.desc = "See available code actions"
--     vim.keymap.set({ "n", "v" }, "<space>a", vim.lsp.buf.code_action, opts)
--
--     opts.desc = "Show LSP references"
--     vim.keymap.set("n", "gr", function()
--         require("telescope.builtin").lsp_references()
--     end, opts)
--
--     opts.desc = "Use LSP to format"
--     vim.keymap.set("n", "<space>f", function()
--         vim.lsp.buf.format({ async = true })
--     end, opts)
--
--     -- opts.desc = "Show buffer diagnostics"
--     -- keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
--
--     opts.desc = "Show line diagnostics"
--     vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line
--
--     opts.desc = "Go to previous diagnostic"
--     vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
--
--     opts.desc = "Go to next diagnostic"
--     vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
--
--     opts.desc = "Restart LSP"
--     vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
--
--     -- Change the Diagnostic symbols in the sign column (gutter)
--     -- (not in youtube nvim video)
--     local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
--     for type, icon in pairs(signs) do
--         local hl = "DiagnosticSign" .. type
--         vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
--     end
-- end


local on_attach_new = function(client, buf)
    vim.lsp.inlay_hint.enable(true)

    local opts = { silent = true }
    opts.buffer = buf

    if client.server_capabilities.hoverProvider then
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    end
    if client.server_capabilities.signatureHelpProvider then
        vim.keymap.set({ 'n', 'i' }, '<c-k>', vim.lsp.buf.signature_help, opts)
    end
    if client.server_capabilities.declarationProvider then
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    end
    if client.server_capabilities.definitionProvider then
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    end
    if client.server_capabilities.typeDefinitionProvider then
        vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, opts)
    end
    if client.server_capabilities.implementationProvider then
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    end
    if client.server_capabilities.referencesProvider then
        opts.desc = "Show LSP references"
        vim.keymap.set("n", "gr", function()
            require("telescope.builtin").lsp_references()
        end, opts)
    end
    if client.server_capabilities.renameProvider then
        vim.keymap.set('n', 'cr', vim.lsp.buf.rename, opts)
    end
    if client.server_capabilities.codeActionProvider then
        vim.keymap.set('n', 'cx', vim.lsp.buf.code_action, opts)
    end

    opts.desc = "Show line diagnostics"
    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

    opts.desc = "Add lsp workspace folder"
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)

    opts.desc = "Remove lsp workspace folder"
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)

    opts.desc = "List lsp workspace folders"
    vim.keymap.set("n", "<space>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)

    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', '<space>', vim.diagnostic.open_float, opts)
    vim.api.nvim_create_user_command('Dllist', vim.diagnostic.setloclist, {})
    vim.api.nvim_create_user_command('Dclist', vim.diagnostic.setqflist, {})

    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
end

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then
            return
        end
        on_attach_new(client, args.buf)
    end,
})
