---@type NvPluginSpec[]
local plugins = {
  -- Override plugin definition options.
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Format & linting.
      {
        "nvimtools/none-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  -- Override plugin configs.
  {
    "williamboman/mason.nvim",
    opts = require "custom.configs.mason",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "custom.configs.treesitter",
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = require "custom.configs.nvimtree",
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
}

return plugins
