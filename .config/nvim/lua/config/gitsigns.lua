require("gitsigns").setup({
  signs = {
    add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
    change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
    delete = { hl = "DiffDelete", text = "_", numhl = "GitSignsDeleteNr" },
    topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
    changedelete = { hl = "DiffChange", text = "~", numhl = "GitSignsChangeNr" },
  },
  numhl = false,
  keymaps = {
    -- Default keymap options
    noremap = true,
    buffer = true,
    ["n ]c"] = { expr = true, "&diff ? ']c' : '<cmd>lua load\"gitsigns\".next_hunk()<CR>'" },
    ["n [c"] = { expr = true, "&diff ? '[c' : '<cmd>lua load\"gitsigns\".prev_hunk()<CR>'" },
    ["n <leader>hs"] = '<cmd>lua load"gitsigns".stage_hunk()<CR>',
    ["n <leader>hu"] = '<cmd>lua load"gitsigns".undo_stage_hunk()<CR>',
    ["n <leader>hr"] = '<cmd>lua load"gitsigns".reset_hunk()<CR>',
    ["n <leader>hp"] = '<cmd>lua load"gitsigns".preview_hunk()<CR>',
    ["n <leader>hb"] = '<cmd>lua load"gitsigns".blame_line()<CR>',
  },
  watch_index = {
    interval = 100,
  },
  sign_priority = 5,
  status_formatter = nil, -- Use default
})
