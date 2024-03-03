return {
	-- {
	-- 	'kepano/flexoki-neovim',
	-- 	-- don't use name flexoki-neovim
	-- 	name = 'flexoki',
	-- 	priority = 1000,
	-- },
	{
		"lunarvim/darkplus.nvim",
		name = "darkplus",
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme darkplus]])
		end
	},
	-- {
	-- 	'sainnhe/sonokai',
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.g.sonokai_style = 'maia'
	-- 		vim.g.sonokai_better_performance = 1
	--
	-- 		vim.cmd([[colorscheme sonokai]])
	-- 	end
	-- },
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
