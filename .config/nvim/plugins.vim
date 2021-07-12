let g:plug_home=expand(stdpath('data') . '/plugged')

" Install vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Plugins
call plug#begin(g:plug_home)

" LSP related plugins
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'

" Code actions
Plug 'kosayoda/nvim-lightbulb'

" Completion
Plug 'hrsh7th/nvim-compe'
Plug 'onsails/lspkind-nvim/'

" Fuzzy finder
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Syntax
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'cespare/vim-toml'
" Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
" Plug 'pangloss/vim-javascript'
" Plug 'yuezk/vim-js'
" Plug 'maxmellon/vim-jsx-pretty'

" A solid language pack (syntax highlighting)
" Plug 'sheerun/vim-polyglot'

" Themes
Plug 'ntk148v/vim-horizon'
Plug 'ghifarit53/tokyonight-vim'
" Plug 'folke/tokyonight.nvim'
Plug 'sainnhe/sonokai'
Plug 'marko-cerovac/material.nvim'
Plug 'Luxed/ayu-vim'
" Plug 'Shatur/neovim-ayu'
" Plug 'CantoroMC/neovim-ayu'

" Misc
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'APZelos/blamer.nvim'
Plug 'justinmk/vim-sneak'
Plug 'airblade/vim-gitgutter'
Plug 'folke/which-key.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'vim-test/vim-test'
Plug 'jiangmiao/auto-pairs'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
Plug 'L3MON4D3/LuaSnip'
Plug 'lukas-reineke/indent-blankline.nvim'

" Highlights words under the cursor
Plug 'RRethy/vim-illuminate'

" Additional powerful text object for vim, this plugin should be studied
" carefully to use its full power
Plug 'wellle/targets.vim'

" Highlight URLs inside vim
Plug 'itchyny/vim-highlighturl'

" Show current search term in different color
Plug 'PeterRincker/vim-searchlight'

" match-up is a plugin that lets you highlight, navigate, and operate on sets of matching text.
" It extends vim's % key to language-specific words instead of just single characters.
Plug 'andymass/vim-matchup'

" UI
Plug 'kyazdani42/nvim-web-devicons'
Plug 'mhinz/vim-startify'
Plug 'psliwka/vim-smoothie'
" Plug 'preservim/nerdtree'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'romgrk/barbar.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" This plugin should always be the last one because of reasons.
" Plug 'ryanoasis/vim-devicons'

call plug#end()

