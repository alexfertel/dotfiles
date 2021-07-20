-- These come first
load("config.ui")
load("config.matchup")
load("config.misc")
load("config.mappings")

vim.cmd("source $MYNVIMCONFIG/lua/config/coc.vim")
vim.cmd("source $MYNVIMCONFIG/lua/config/autocommands.vim")

-- These come after
load("config.treesitter")
-- load("config.compe")
-- load("config.lightbulb")
load("config.lualine")
load("config.gitsigns")
load("config.blankline")
load("config.nvimtree")
load("config.lightspeed")
load("config.bufferline")
load("config.autopairs")
load("config.telescope")
load("config.persistence")
load("config.startify")
