return {
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
    },

    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = true,
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            -- setup defaults
            require('lualine').setup({})
        end,
    },

    -- which key setup
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    -- config manager for neovim, for project local and global
    { "folke/neoconf.nvim", cmd = "Neoconf" },

    -- setup for lua neovim api
    "folke/neodev.nvim",

    "sindrets/diffview.nvim",
};
