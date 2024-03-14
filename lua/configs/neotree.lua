return {
    close_if_last_window = true,
    popup_border_style = "rounded",
    follow_current_file = {
        enabled = true
    },
    window = {
        position = "float",
        width = 60,
        mappings = {
            ["h"] = "close_node",
            ["l"] = "toggle_node",
        }
    },
    filesystem = {
        hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
        group_empty_dirs = true,
    },
}
