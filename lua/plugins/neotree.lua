return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cond = not vim.g.vscode,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        {
            "s1n7ax/nvim-window-picker",
            version = "2.*",
            config = function()
                require("window-picker").setup({
                    filter_rules = {
                        include_current_win = false,
                        autoselect_one = true,
                        -- filter using buffer options
                        bo = {
                            filetype = { "neo-tree", "neo-tree-popup", "notify" },
                            -- if the buffer type is one of following, the window will be ignored
                            buftype = { "terminal", "quickfix" },
                        },
                    },
                })
            end,
        },
    },
    cmd = { "Neotree" },
    keys = {
        { "<leader>bb", "<cmd>Neotree toggle buffers<cr>", remap = false, silent = true, desc = "NeoTree buffers" },
        { "<leader>bf", "<Cmd>Neotree toggle<CR>", remap = false, silent = true, desc = "NeoTree files" },
    },
    init = function()
        vim.g.neo_tree_remove_legacy_commands = 1
        ---@type string[]
        local argv = vim.fn.argv() or {} ---@diagnostic disable-line
        if vim.tbl_contains(argv, ".") then -- load neo-tree when `nvim .`
            vim.schedule(function()
                pcall(require, "neo-tree")
            end)
        end
    end,
    config = function()
        require("neo-tree").setup(require("configs.neotree"))
    end,
}
