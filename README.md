# super fast neovim config

This is a neovim config that is super fast and optimized for my workflow. It is meant to be used as a standalone neovim config.
But it also requires lsps to be installed and configured manually, which I prefer.

## plugins

- Neovim 0.10.0 or higher
- ftplugins for rust, go, lua and rust filetypes, we avoid nvim-lspconfig for this
- Treesitter for syntax highlighting
- LSP for autocompletion, diagnostics, formatting, etc
- Telescope for fuzzy finder
- Whichkey for custom keybindings
- Using [lazy.nvim](https://github.com/folke/lazy.nvim) for managing plugins

## installation

1. Install nvim with [neovim installation doc](https://github.com/neovim/neovim/blob/master/INSTALL.md)
2. Clone this repo to your nvim config folder, `git clone https://github.com/swarnimarun/nvim.git ~/.config/nvim`
3. On windows you will need to add it to the %APPDATA% folder. I generally recommend doing a mklink
   for the config folder, so that you can have the config folder in the same location. Less cognitive load.
4. Consider backing up your current config folder to a different location, just in case.

## keymaps

### lsp

Checkout the [lsp folder](https://github.com/swarnimarun/nvim/tree/postmodern/lua/lsp) for the lsp configs and keymaps.

