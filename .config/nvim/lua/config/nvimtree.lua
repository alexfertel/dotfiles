vim.g.nvim_tree_width = 40
vim.g.nvim_tree_auto_ignore_ft = { "startify", "dashboard" } -- empty by default, don't auto open tree on specific filetypes.
vim.g.nvim_tree_width_allow_resize = 1 -- 0 by default, will not resize the tree when opening a file

require'nvim-tree'.setup({
  renderer = {
    add_trailing = true,
    group_empty = true,
    highlight_git = true,
    root_folder_modifier = ":~",
    indent_markers = {
      enable = false,
    },
    icons = {
      webdev_colors = true,
      glyphs = {
        default = "",
        symlink = "",
        git = {
            unstaged = "✗",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "★",
            deleted = "",
            ignored = "◌",
        },
        folder = {
            -- disable indent_markers option to get arrows working or if you want both arrows and indent then just add the arrow icons in front            ofthe default and opened folders below!
            -- arrow_open = "",
            -- arrow_closed = "",
            default = "",
            open = "",
            empty = "", -- 
            empty_open = "",
            symlink = "",
            symlink_open = "",
        },
      }
    },
  },
  filters = {
      custom = { ".git", "node_modules", ".cache" }
  },
  actions = {
    use_system_clipboard = true,
    open_file = {
      quit_on_open = true,
      resize_window = true,
    },
  },
})
