-- relative numbering for non active lines
vim.wo.relativenumber = true
-- show actual line number for current line instead of zero
vim.wo.number = true
vim.opt.ruler = true
vim.opt.conceallevel = 2
local TAB_WIDTH = 4

vim.opt.wrap = true
vim.opt.shiftwidth = TAB_WIDTH
vim.opt.softtabstop = TAB_WIDTH
vim.opt.tabstop = TAB_WIDTH
vim.opt.expandtab = true
vim.opt.textwidth = 100

vim.o.titlestring = " ❐ %t %r %m"
vim.o.titleold = '%{fnamemodify(getcwd(), ":t")}'
vim.o.title = true
vim.o.titlelen = 70

vim.o.mouse = "a"
vim.o.mousefocus = true

vim.o.clipboard = "unnamedplus"
