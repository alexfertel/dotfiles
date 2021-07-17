require("util")
require("options")

require("plugins")
require("lsp")

-- These come first
require("config.ui")
require("config.misc")
require("config.mappings")

-- These come after
require("config.treesitter")
require("config.compe")
require("config.lightbulb")
require("config.lualine")
require("config.autocommands")
require("config.gitsigns")
require("config.blankline")
require("config.nvimtree")
require("config.lightspeed")
require("config.bufferline")
require("config.autopairs")
require("config.telescope")
