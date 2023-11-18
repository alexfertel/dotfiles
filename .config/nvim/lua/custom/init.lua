-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- Make sure we save synchronously before quiting.
vim.cmd [[cnoreabbrev wq update <bar> wq]]
vim.cmd [[cnoreabbrev x update <bar> x]]

-- Automatically wrap at 100 characters and spell check git commit messages
vim.cmd [[autocmd FileType gitcommit setlocal textwidth=100]]
vim.cmd [[autocmd FileType gitcommit setlocal spell]]
