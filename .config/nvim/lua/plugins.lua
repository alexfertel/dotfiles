require("paq-nvim")({
	"savq/paq-nvim",

	-- lsp
	"neovim/nvim-lspconfig",
	"hrsh7th/nvim-compe",
	"kosayoda/nvim-lightbulb",
	"onsails/lspkind-nvim",
	"jose-elias-alvarez/nvim-lsp-ts-utils",
	"jose-elias-alvarez/null-ls.nvim",

	-- fuzzy finder
	"nvim-lua/popup.nvim",
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim",
	-- { 'nvim-telescope/telescope-fzy-native.nvim', run='git submodule update --init --recursive' };

	-- syntax
	"nvim-treesitter/nvim-treesitter",
	"cespare/vim-toml",
	"folke/lua-dev.nvim",

	-- ui
	"kyazdani42/nvim-web-devicons",
	"mhinz/vim-startify",
	"psliwka/vim-smoothie",
	"kyazdani42/nvim-tree.lua",
	"akinsho/nvim-bufferline.lua",
	"hoob3rt/lualine.nvim",
	-- "vim-airline/vim-airline",
	-- "vim-airline/vim-airline-themes",

	-- themes
	"folke/tokyonight.nvim",
	"sainnhe/sonokai",
	"Luxed/ayu-vim",

	-- misc
	"tpope/vim-commentary",
	"tpope/vim-surround",
	"tpope/vim-repeat",
	"tpope/vim-speeddating",
	"tpope/vim-unimpaired",
	"tpope/vim-fugitive",
	"tpope/vim-dispatch",
	"junegunn/goyo.vim",
	"junegunn/limelight.vim",
	"APZelos/blamer.nvim",
	"ggandor/lightspeed.nvim",
	"lewis6991/gitsigns.nvim",
	"folke/which-key.nvim",
	"norcalli/nvim-colorizer.lua",
	"vim-test/vim-test",
	"windwp/nvim-autopairs",
	"simrat39/rust-tools.nvim",
	"lukas-reineke/indent-blankline.nvim",
	"andymass/vim-matchup",
	"dstein64/vim-startuptime",
	"romainl/vim-qf",
	"brooth/far.vim",
	"rhysd/git-messenger.vim",

	-- Additional powerful text object for vim, this plugin should be studied
	-- carefully to use its full power
	"wellle/targets.vim",

	-- Highlight URLs inside vim
	"itchyny/vim-highlighturl",

	-- Support for latex files
	{ "lervag/vimtex", opt = true },
})
