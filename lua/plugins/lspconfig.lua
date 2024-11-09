local on_attach = function(client, bufnr)
    local keymap = vim.keymap -- for conciseness

    local opts = { noremap = true, silent = true }
    -- set keybinds for the entire buffer
    opts.buffer = bufnr
    vim.lsp.inlay_hint.enable(true)

    opts.desc = "Go to declaration"
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    opts.desc = "Show LSP definitions"
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    opts.desc = "Show documentation for what is under cursor"
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    opts.desc = "Show LSP implementations"
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

    opts.desc = "Show signature help"
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

    opts.desc = "Add lsp workspace folder"
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)

    opts.desc = "Remove lsp workspace folder"
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)

    opts.desc = "List lsp workspace folders"
    vim.keymap.set("n", "<space>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)

    opts.desc = "Show LSP type definitions"
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)

    opts.desc = "Smart rename"
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)

    opts.desc = "See available code actions"
    vim.keymap.set({ "n", "v" }, "<space>a", vim.lsp.buf.code_action, opts)

    opts.desc = "Show LSP references"
    vim.keymap.set("n", "gr", function()
        require("telescope.builtin").lsp_references()
    end, opts)

    opts.desc = "Use LSP to format"
    vim.keymap.set("n", "<space>f", function()
        vim.lsp.buf.format({ async = true })
    end, opts)

    -- opts.desc = "Show buffer diagnostics"
    -- keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

    opts.desc = "Show line diagnostics"
    keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

    opts.desc = "Go to previous diagnostic"
    keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

    opts.desc = "Go to next diagnostic"
    keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

    opts.desc = "Restart LSP"
    keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
end
return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            { "antosha417/nvim-lsp-file-operations", config = true },
        },
        config = function()
            -- import cmp-nvim-lsp plugin
            local cmp_nvim_lsp = require("cmp_nvim_lsp")

            -- used to enable autocompletion (assign to every lsp server config)
            local capabilities = cmp_nvim_lsp.default_capabilities()

            -- import lspconfig plugin
            local lspconfig = require("lspconfig")

            -- configure html server
            lspconfig["kotlin_language_server"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            -- configure html server
            lspconfig["html"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            -- configure typescript server with plugin
            lspconfig["tsserver"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            -- configure css server
            lspconfig["cssls"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            -- configure templ server
            lspconfig["templ"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            -- configure gdscript server
            lspconfig["gdscript"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            -- configure gdshader-lsp server
            lspconfig["gdshader_lsp"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            -- configure tailwindcss server
            lspconfig["tailwindcss"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            -- configure svelte server
            lspconfig["svelte"].setup({
                capabilities = capabilities,
                on_attach = function(client, bufnr)
                    on_attach(client, bufnr)

                    vim.api.nvim_create_autocmd("BufWritePost", {
                        pattern = { "*.js", "*.ts" },
                        callback = function(ctx)
                            if client.name == "svelte" then
                                client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
                            end
                        end,
                    })
                end,
            })

            -- configure prisma orm server
            lspconfig["prismals"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            -- configure graphql language server
            lspconfig["graphql"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
            })

            -- configure emmet language server
            lspconfig["emmet_ls"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
            })

            -- configure omnisharp server
            lspconfig["omnisharp"].setup({
                cmd = { "dotnet", "/Users/swarnimarun/.cache/omnisharp-vim/omnisharp-roslyn/OmniSharp.dll" },
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    FormattingOptions = {
                        enableEditorConfigSupport = true,
                        newLine = "\n",
                        useTabs = false,
                        tabSize = 4,
                        indentationSize = 4,

                        NewLinesForBracesInTypes = false,
                        NewLinesForBracesInMethods = false,
                        NewLinesForBracesInProperties = false,
                        NewLinesForBracesInAccessors = false,
                        NewLinesForBracesInAnonymousMethods = false,
                        NewLinesForBracesInControlBlocks = false,
                        NewLinesForBracesInAnonymousTypes = false,
                        NewLinesForBracesInObjectCollectionArrayInitializers = false,
                        NewLinesForBracesInLambdaExpressionBody = false,

                        NewLineForElse = false,
                        NewLineForCatch = false,
                        NewLineForFinally = false,
                        NewLineForMembersInObjectInit = false,
                        NewLineForMembersInAnonymousTypes = false,
                        NewLineForClausesInQuery = false,
                    },
                },
            })

            -- configure python server
            lspconfig["pyright"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            -- configure gleam server
            lspconfig["gleam"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    gleam = {
                        format = true,
                    },
                },
            })
            -- configure zig language server
            lspconfig["zls"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    zls = {
                        enable_inlay_hints = true,
                        inlay_hints_show_builtin = true,
                        inlay_hints_exclude_single_argument = true,
                        inlay_hints_hide_redundant_param_names = true,
                        inlay_hints_hide_redundant_param_names_last_token = true,
                    }
                }
            })

            -- configure go server
            lspconfig["gopls"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = { -- custom settings for lua
                    hints = {
                        assignVariableTypes = true,
                        compositeLiteralFields = true,
                        compositeLiteralTypes = true,
                        constantValues = true,
                        functionTypeParameters = true,
                        parameterNames = true,
                        rangeVariableTypes = true,
                    },
                },
            })

            -- configure astro server
            lspconfig["astro"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            -- configure lua server (with special settings)
            lspconfig["lua_ls"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = { -- custom settings for lua
                    Lua = {
                        -- make the language server recognize "vim" global
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            -- make language server aware of runtime files
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.stdpath("config") .. "/lua"] = true,
                            },
                        },
                        hint = {
                            enable = true,
                        },
                    },
                },
            })
        end,
    },
    {
        "mrcjkb/rustaceanvim",
        version = "^4", -- Recommended
        ft = { "rust" },
        config = function()
            vim.g.rustaceanvim = {
                -- Plugin configuration
                -- tools = {},
                -- LSP configuration
                server = {
                    on_attach = function(c, b)
                        vim.keymap.set("n", "<leader>a", function()
                            vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
                            -- or vim.lsp.buf.codeAction() if you don't want grouping.
                        end, { silent = true, buffer = b })
                        on_attach(c, b)
                    end,
                    settings = {
                        -- rust-analyzer language server configuration
                        ["rust-analyzer"] = {},
                    },
                    --   -- DAP configuration
                    dap = {},
                },
            }
        end,
    },
    { "b0o/SchemaStore.nvim", version = false },
    {
        "pmizio/typescript-tools.nvim",
        name = "typescript-tools",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        event = { "BufReadPost *.ts,*.tsx,*.js,*.jsx", "BufNewFile *.ts,*.tsx,*.js,*.jsx" },
        opts = {},
        config = function()
            require("typescript-tools").setup({
                settings = {
                    tsserver_file_preferences = {
                        includeInlayParameterNameHints = "all",
                        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayVariableTypeHints = true,
                        includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                        includeInlayFunctionLikeReturnTypeHints = true,
                    },
                },
                on_attach = function(_, bufnr)
                    vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#6272A4", italic = true })
                    vim.lsp.inlay_hint.enable(true)
                end,
            })
        end,
    },
    "ionide/Ionide-vim",
    "p00f/clangd_extensions.nvim",
}
