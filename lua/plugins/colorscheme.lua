--  -- the colorscheme should be available when starting Neovim
return {
	{
		'kepano/flexoki-neovim',
		name = 'flexoki',
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme flexoki-dark]])
		end
	}

	-- {
	--   "bluz71/vim-nightfly-guicolors",
	--   priority = 1000, -- make sure to load this before all the other start plugins
	--   config = function()
	--     -- load the colorscheme here
	--     vim.cmd([[colorscheme nightfly]])
	--   end,
	-- },
	-- {
	--    "folke/tokyonight.nvim",
	--    lazy = false, -- make sure we load this during startup if it is your main colorscheme
	--    priority = 1000, -- make sure to load this before all the other start plugins
	--    config = function()
	--      -- load the colorscheme here
	--      vim.cmd([[colorscheme tokyonight-moon]])
	--    end,
	--  },
};
