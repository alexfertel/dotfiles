vim.g.nvim_tree_width = 40
vim.g.nvim_tree_ignore = { ".git", "node_modules", ".cache" }
vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_auto_ignore_ft = { "startify", "dashboard" } -- empty by default, don't auto open tree on specific filetypes.
vim.g.nvim_tree_quit_on_open = 1 -- 0 by default, closes the tree when you open a file
vim.g.nvim_tree_git_hl = 1 -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
vim.g.nvim_tree_root_folder_modifier = ":~" -- This is the default. See :help filename-modifiers for more options
vim.g.nvim_tree_width_allow_resize = 1 -- 0 by default, will not resize the tree when opening a file
vim.g.nvim_tree_indent_markers = 1 -- 0 by default, this option shows indent markers when folders are open
vim.g.nvim_tree_add_trailing = 1 -- 0 by default, append a trailing slash to folder names
vim.g.nvim_tree_group_empty = 1 --  0 by default, compact folders that only contain a single folder into one node in the file tree
vim.g.nvim_tree_special_files = { "README.md", "Makefile", "MAKEFILE" } -- List of filenames that gets highlighted with NvimTreeSpecialFile
vim.g.nvim_tree_show_icons = { git = 1, folders = 1, folder_arrows = 1, files = 1 }
vim.g.nvim_tree_icons = {
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

require'nvim-tree'.setup()
