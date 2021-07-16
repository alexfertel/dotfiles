-- Set internal encoding of vim, not needed on neovim, since coc.nvim using some
-- unicode characters in the file autoload/float.vim
vim.opt.encoding = 'utf-8'

-- TextEdit might fail if hidden is not set.
vim.opt.hidden = true

-- Some servers have issues with backup files, see #649.
vim.g.nobackup = true
vim.g.nowritebackup = true

-- Give more space for displaying messages.
vim.opt.cmdheight = 3

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 300

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append 'c'

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved.
vim.opt.signcolumn = 'yes'

-- General tab settings
vim.opt.tabstop        = 4       -- number of visual spaces per TAB
vim.opt.softtabstop    = 4       -- number of spaces in tab when editing
vim.opt.shiftwidth     = 4       -- number of spaces to use for autoindent
vim.opt.expandtab      = true    -- expand tab to spaces so that tabs are spaces

-- Set matching pairs of characters and highlight matching brackets
vim.opt.matchpairs:append { '<:>', '「:」', '『:』', '【:】', '“:”', '‘:’', '《:》' }

-- Show line number and relative line number
vim.opt.number         = true 
vim.opt.relativenumber = true

-- Ignore case in general, but become case-sensitive when uppercase is present
vim.opt.ignorecase     = true
vim.opt.smartcase      = true

-- Break line at predefined characters
vim.opt.linebreak = true

-- Character to show before the lines that have been soft-wrapped
vim.opt.showbreak = '↪'

-- Minimum lines to keep above and below cursor when scrolling
vim.opt.scrolloff = 3

vim.opt.fileformats = { 'unix' , 'dos' }  -- Fileformats to use for new files

vim.opt.inccommand = 'nosplit'  -- Show the result of substitution in real time for preview

-- Ignore certain files and folders when globbing
vim.opt.wildignore:append { '*.o', '*.obj', '*.bin', '*.dll', '*.exe' }
vim.opt.wildignore:append { '*/.git/*', '*/.svn/*', '*/__pycache__/*', '*/build/**' }
vim.opt.wildignore:append { '*.jpg', '*.png', '*.jpeg', '*.bmp', '*.gif', '*.tiff', '*.svg', '*.ico' }
vim.opt.wildignore:append { '*.pyc' }
vim.opt.wildignore:append { '*.DS_Store' }
vim.opt.wildignore:append { '*.aux', '*.bbl', '*.blg', '*.brf', '*.fls', '*.fdb_latexmk', '*.synctex.gz', '*.xdv' }
vim.opt.wildignorecase = true  -- ignore file and dir name cases in cmd-completion

-- Ask for confirmation when handling unsaved or read-only files
vim.opt.confirm = true

vim.opt.visualbell   = true
-- vim.opt.noerrorbells = true  -- Do not use visual and errorbells
vim.opt.history = 500  -- The number of command and search history to keep

-- Completion behaviour
-- set completeopt+=menuone  -- Show menu even if there is only one item
vim.opt.completeopt = { 'menuone', 'noselect' }

-- Align indent to next multiple value of shiftwidth. For its meaning,
-- see http://vim.1045645.n5.nabble.com/shiftround-option-td5712100.html
vim.opt.shiftround = true

-- Do not add two spaces after a period when joining lines or formatting texts,
-- see https://stackoverflow.com/q/4760428/6064933
-- vim.opt.nojoinspaces = true

vim.opt.backspace = 'indent', 'eol', 'start'
vim.opt.complete:remove{ 'i' }
vim.opt.nrformats:remove{ 'octal' }

-- This will make all yank/delete/paste operations to use the system
-- register, avoiding having to type the dreaded characters each time
-- we write one of these operations.
vim.opt.clipboard:prepend{ 'unnamed', 'unnamedplus' }

-- Adds a little margin
vim.opt.foldcolumn = '1'                                          
-- Line number column width
vim.opt.numberwidth = 4                                         
vim.opt.showcmd = true                       -- Shows entered commands

vim.cmd('highlight link CompeDocumentation NormalFloat')

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


