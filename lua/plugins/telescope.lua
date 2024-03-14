return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        "debugloop/telescope-undo.nvim",
    },
    keys = {
        {
            '<leader>ff',
            function() require 'telescope.builtin'.find_files() end,
            mode = 'n',
            desc =
            "Find files in cwd"
        },
        {
            '<leader>fr',
            function() require 'telescope.builtin'.oldfiles() end,
            mode = 'n',
            desc =
            "Recent files"
        },
        {
            '<leader>fg',
            function() require 'telescope.builtin'.live_grep() end,
            mode = 'n',
            desc =
            "Grep files in cwd"
        },
        { '<leader>fb', function() require 'telescope.builtin'.buffers() end, mode = 'n', desc = "Buffers" },
        {
            '<leader>fh',
            function() require 'telescope.builtin'.help_tags() end,
            mode = 'n',
            desc =
            "Help tags"
        },
        {
            '<leader>fj',
            function() require 'telescope.builtin'.jumplist() end,
            mode = 'n',
            desc =
            "Jumplist"
        },
        { '<leader>fk', function() require 'telescope.builtin'.keymaps() end, mode = 'n', desc = "Keymaps" },
        {
            '<leader>fc',
            function() require 'telescope.builtin'.commands() end,
            mode = 'n',
            desc =
            "Commands"
        },
        -- Undo
        { "<leader>fu", "<cmd>Telescope undo<cr>", mode = 'n', desc = "undo history" },
        -- Git telescope
        {
            '<leader>ss',
            function() require 'telescope.builtin'.git_stash() end,
            mode = 'n',
            desc =
            "Git Stash"
        },
        {
            '<leader>sc',
            function() require 'telescope.builtin'.git_commits() end,
            mode = 'n',
            desc =
            "Git Commits"
        },
        {
            '<leader>sb',
            function() require 'telescope.builtin'.git_branches() end,
            mode = 'n',
            desc =
            "Git Branches"
        },
    },
    config = function()
        require('telescope').setup({
            extensions = {
                undo = {
                    -- telescope-undo.nvim config, see below
                },
                -- other extensions:
                -- file_browser = { ... }
            },
        })
    end
}
