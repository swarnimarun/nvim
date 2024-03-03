local options = { noremap = true }
options.desc = "Exit"
vim.keymap.set("i", "kj", "<Esc>", options)

options.desc = "Redo last change"
vim.keymap.set("n", "U", "<C-R>", options)

-- testing with this, if it works well we will use it.
vim.keymap.set("n", "m", "v", { desc = "Visual mode" })
