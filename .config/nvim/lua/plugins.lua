local function plug(path, config)
  vim.validate({
    path = { path, "s" },
    config = { config, vim.tbl_islist, "an array of packages" },
  })
  vim.fn["plug#begin"](path)
  for _, v in ipairs(config) do
    if type(v) == "string" then
      vim.fn["plug#"](v)
    elseif type(v) == "table" then
      local p = v[1]
      assert(p, "Must specify package as first index.")
      v[1] = nil
      vim.fn["plug#"](p, v)
      v[1] = p
    end
  end
  vim.fn["plug#end"]()
end

plug("~/.local/share/nvim/plugged", {
   -- lsp
   -- "neovim/nvim-lspconfig",
   -- "hrsh7th/nvim-compe",
   -- "kosayoda/nvim-lightbulb",
   -- "onsails/lspkind-nvim",
   -- "jose-elias-alvarez/nvim-lsp-ts-utils",
   -- "jose-elias-alvarez/null-ls.nvim",
   -- "JoosepAlviste/nvim-ts-context-commentstring",
   -- "windwp/nvim-ts-autotag",
   'neovim/nvim-lspconfig',
   'williamboman/mason.nvim',
   'williamboman/mason-lspconfig.nvim',

   'hrsh7th/nvim-cmp',
   'hrsh7th/cmp-buffer',
   'hrsh7th/cmp-path',
   'saadparwaiz1/cmp_luasnip',
   'hrsh7th/cmp-nvim-lsp',
   'hrsh7th/cmp-nvim-lua',

   'L3MON4D3/LuaSnip',
   'rafamadriz/friendly-snippets',

   'VonHeikemen/lsp-zero.nvim',

   -- coc
   -- { "neoclide/coc.nvim", branch = "release" },

   -- fuzzy finder
   "nvim-lua/plenary.nvim",
   "nvim-telescope/telescope.nvim",
   "nvim-telescope/telescope-fzy-native.nvim",

   -- syntax
   -- Always run `:TSUpdate` after updating this
   "nvim-treesitter/nvim-treesitter",
   -- "cespare/vim-toml",
   -- "folke/lua-dev.nvim",
   -- "tikhomirov/vim-glsl",

   -- ui
   "kyazdani42/nvim-web-devicons",
   "mhinz/vim-startify",
   "psliwka/vim-smoothie",
   "kyazdani42/nvim-tree.lua",
   "akinsho/nvim-bufferline.lua",
   "hoob3rt/lualine.nvim",

   -- themes
   "folke/tokyonight.nvim",
   "sainnhe/sonokai",
   "Luxed/ayu-vim",
   "rose-pine/neovim",
   "navarasu/onedark.nvim",

   -- misc
   "tpope/vim-commentary",
   "tpope/vim-surround",
   "tpope/vim-repeat",
   "tpope/vim-speeddating",
   "tpope/vim-unimpaired",
   "tpope/vim-fugitive",
   "tpope/vim-dispatch",
   "tpope/vim-abolish",
   "junegunn/goyo.vim",
   "junegunn/limelight.vim",
   "APZelos/blamer.nvim",
   "ggandor/lightspeed.nvim",
   "lewis6991/gitsigns.nvim",
   "norcalli/nvim-colorizer.lua",
   "vim-test/vim-test",
   "windwp/nvim-autopairs",
   -- "simrat39/rust-tools.nvim",
   -- "lukas-reineke/indent-blankline.nvim",
   "andymass/vim-matchup",
   "dstein64/vim-startuptime",
   "romainl/vim-qf",
   "brooth/far.vim",
   "rhysd/git-messenger.vim",
   "folke/which-key.nvim",
   "sindrets/diffview.nvim",
   "github/copilot.vim",

   -- Snippets
   -- "hrsh7th/vim-vsnip",
   -- "hrsh7th/vim-vsnip-integ",

   -- Additional powerful text object for vim, this plugin should be studied
   -- carefully to use its full power
   "wellle/targets.vim",

   -- Highlight URLs inside vim
   -- "itchyny/vim-highlighturl",

   -- Support for latex files
   -- "lervag/vimtex",
})
