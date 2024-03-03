---@type NvPluginSpec[]
local plugins = {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Format & linting.
      {
        "nvimtools/none-ls.nvim",
        commit = "bb680d752cec37949faca7a1f509e2fe67ab418a",
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
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
  {
    "saecki/crates.nvim",
    tag = "v0.4.0",
    event = { "BufRead Cargo.toml" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      require("cmp").setup.buffer {
        sources = { { name = "crates" } },
      }
      require "custom.configs.crates"
      crates.show()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = require "custom.configs.cmp",
  },
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
  { "psliwka/vim-smoothie", lazy = false },
  { "tpope/vim-surround", lazy = false },
  { "tpope/vim-repeat", lazy = false },
  { "tpope/vim-unimpaired", lazy = false },
  { "APZelos/blamer.nvim", lazy = false },
  { "wellle/targets.vim", lazy = false },
  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
    end,
    lazy = false,
  },
}

return plugins
