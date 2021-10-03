-- These come first
require("config.ui")
require("config.matchup")
require("config.misc")
require("config.mappings")

vim.cmd("source $MYNVIMCONFIG/lua/config/coc.vim")
vim.cmd("source $MYNVIMCONFIG/lua/config/autocommands.vim")

-- These come after
require("config.treesitter")
-- require("config.compe")
-- require("config.lightbulb")
require("config.lualine")
require("config.git-messenger")
require("config.gitsigns")
require("config.blankline")
require("config.nvimtree")
require("config.lightspeed")
require("config.bufferline")
require("config.autopairs")
require("config.telescope")
require("config.startify")

