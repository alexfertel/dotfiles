local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window.
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

-- Automatically wrap at 100 characters and spell check git commit messages.
vim.cmd [[autocmd FileType gitcommit setlocal textwidth=100]]
vim.cmd [[autocmd FileType gitcommit setlocal spell]]

-- TextEdit might fail if hidden is not set.
vim.opt.hidden = true

-- Some servers have issues with backup files, see #649.
vim.g.nobackup = true
vim.g.nowritebackup = true

-- Give more space for displaying messages.
vim.opt.cmdheight = 4

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 100

-- Display leading spaces as '·'
vim.opt.listchars:prepend "space:·"

-- General tab settings
vim.opt.tabstop = 4 -- number of visual spaces per TAB
vim.opt.softtabstop = 4 -- number of spaces in tab when editing
vim.opt.shiftwidth = 4 -- number of spaces to use for autoindent

-- Set matching pairs of characters and highlight matching brackets
vim.opt.matchpairs:append { "<:>", "「:」", "『:』", "【:】", "“:”", "‘:’", "《:》" }

-- Show line number and relative line number
vim.opt.number = true
vim.opt.relativenumber = true

-- Break line at predefined characters
vim.opt.linebreak = true

-- Character to show before the lines that have been soft-wrapped
vim.opt.showbreak = "↪"

-- Minimum lines to keep above and below cursor when scrolling
vim.opt.scrolloff = 3
vim.opt.fileformats = { "unix", "dos" } -- Fileformats to use for new files
vim.opt.inccommand = "nosplit" -- Show the result of substitution in real time for preview

-- Ignore certain files and folders when globbing
vim.opt.wildignore:append { "*.o", "*.obj", "*.bin", "*.dll", "*.exe" }
vim.opt.wildignore:append { "*/.git/*", "*/.svn/*", "*/__pycache__/*", "*/build/**" }
vim.opt.wildignore:append { "*.jpg", "*.png", "*.jpeg", "*.bmp", "*.gif", "*.tiff", "*.svg", "*.ico" }
vim.opt.wildignore:append { "*.pyc" }
vim.opt.wildignore:append { "*.DS_Store" }
vim.opt.wildignore:append { "*.aux", "*.bbl", "*.blg", "*.brf", "*.fls", "*.fdb_latexmk", "*.synctex.gz", "*.xdv" }
vim.opt.wildignorecase = true -- ignore file and dir name cases in cmd-completion

-- Ask for confirmation when handling unsaved or read-only files
vim.opt.confirm = true
vim.opt.visualbell = true
vim.opt.history = 500 -- The number of command and search history to keep

-- Completion behaviour
vim.opt.completeopt = { "menuone", "noselect" }

-- Align indent to next multiple value of shiftwidth. For its meaning,
-- see http://vim.1045645.n5.nabble.com/shiftround-option-td5712100.html
vim.opt.shiftround = true

vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.complete:remove { "i" }
vim.opt.nrformats:remove { "octal" }

-- This will make all yank/delete/paste operations to use the system
-- register, avoiding having to type the dreaded characters each time
-- we write one of these operations.
vim.opt.clipboard:prepend { "unnamed", "unnamedplus" }

-- Adds a little margin
vim.opt.foldcolumn = "1"

-- Line number column width
vim.opt.numberwidth = 4
vim.opt.showcmd = true -- Shows entered commands

local fences = {
  "lua",
  "json",
  "typescript",
  "javascript",
  "js=javascript",
  "ts=typescript",
  "shell=sh",
  "python",
  "sh",
  "console=sh",
}

vim.g.markdown_fenced_languages = fences

vim.g.blamer_enabled = 1
vim.g.blamer_delay = 500
vim.g.blamer_relative_time = 1
