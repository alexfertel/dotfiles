require("paq-nvim")({
	"savq/paq-nvim",

	-- lsp
	"neovim/nvim-lspconfig",
	"kabouzeid/nvim-lspinstall",
	"hrsh7th/nvim-compe",
	"folke/trouble.nvim",
	"kosayoda/nvim-lightbulb",
	"onsails/lspkind-nvim",
	"jose-elias-alvarez/nvim-lsp-ts-utils",

	-- fuzzy finder
	"nvim-lua/popup.nvim",
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim",
	-- { 'nvim-telescope/telescope-fzy-native.nvim', run='git submodule update --init --recursive' };

	-- syntax
	"nvim-treesitter/nvim-treesitter",
	"cespare/vim-toml",
	"folke/lua-dev.nvim",
	-- 'HerringtonDarkholme/yats.vim';
	-- 'pangloss/vim-javascript';
	-- 'yuezk/vim-js';
	-- 'maxmellon/vim-jsx-pretty';

	-- ui
	"kyazdani42/nvim-web-devicons",
	"mhinz/vim-startify",
	"psliwka/vim-smoothie",
	"kyazdani42/nvim-tree.lua",
	"akinsho/nvim-bufferline.lua",
	"vim-airline/vim-airline",
	"vim-airline/vim-airline-themes",

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
	"justinmk/vim-sneak",
	"lewis6991/gitsigns.nvim",
	"folke/which-key.nvim",
	"norcalli/nvim-colorizer.lua",
	"vim-test/vim-test",
	"windwp/nvim-autopairs",
	-- 'L3MON4D3/LuaSnip';
	"lukas-reineke/indent-blankline.nvim",
	"andymass/vim-matchup",
	"RRethy/vim-illuminate",

	-- Additional powerful text object for vim, this plugin should be studied
	-- carefully to use its full power
	"wellle/targets.vim",

	-- Highlight URLs inside vim
	"itchyny/vim-highlighturl",

	-- Show current search term in different color
	-- 'PeterRincker/vim-searchlight';

	-- Support for latex files
	{ "lervag/vimtex", opt = true },
})
