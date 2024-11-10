# Postmodern Neovim Config

A high-performance, minimal Neovim configuration optimized for modern development workflows. Fast, lean, and fully customizable, this config includes essential features like LSP support, Treesitter-based syntax highlighting, and fuzzy search.

## Prerequisites

Before you begin, ensure the following:

- **Neovim 0.10.0+**: This configuration is designed for Neovim 0.10.0 or later.
- **Manual LSP Setup**: LSP servers for languages such as Rust, Go, and Lua need to be set up manually.
- **Treesitter**: For fast and accurate syntax highlighting.
- **Filetype-specific Plugins**: Includes plugins for Rust, Go, and Lua.

## Installation

### 1. Install Neovim

Ensure you have Neovim 0.10.0 or higher installed. You can follow the official installation guide here:

- [Neovim Installation Guide](https://github.com/neovim/neovim/blob/master/INSTALL.md)

### 2. Clone the Configuration

Clone this repository into your Neovim configuration directory:

```bash
git clone https://github.com/swarnimarun/nvim.git ~/.config/nvim
```

For **Windows** users, clone the repository into `%APPDATA%\nvim` or create a symbolic link to the config folder.

### 3. Backup Your Existing Configuration (Optional)

If you have an existing Neovim configuration, consider backing it up before replacing it:

```bash
mv ~/.config/nvim ~/.config/nvim_backup
```

## Plugins & Features

This configuration includes the following core plugins and features:

- **Treesitter**: For fast, accurate, and reliable syntax highlighting.
- **Telescope**: A powerful and extensible fuzzy finder for navigating files, buffers, and more.
- **WhichKey**: A helpful plugin that displays available keybindings to improve your workflow.
- **Lazy.nvim**: A plugin manager designed to optimize Neovim startup time.

### LSP Integration

LSPs for languages like Rust, Go, and Lua must be set up manually. This configuration does not use `nvim-lspconfig`, giving you complete control over the LSPs you choose to install and configure.

For detailed instructions on setting up LSPs, check the **LSP Configuration Folder**:

- [LSP Configs & Keymaps](https://github.com/swarnimarun/nvim/tree/postmodern/lua/lsp)

### Customization

Feel free to customize this configuration to fit your specific needs:

- Edit the plugin list in the `plugins` folder.
- Modify keybindings and LSP settings as needed.

## Contributing

If you have suggestions, bug fixes, or improvements, please open an issue or submit a pull request. Contributions are always appreciated!

## License

This project is licensed under the [MIT License](LICENSE).

Enjoy your **Postmodern Neovim** setup! 🚀

