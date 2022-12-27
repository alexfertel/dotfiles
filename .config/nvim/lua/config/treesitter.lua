-- require("nvim-treesitter.install").compilers = { "gcc", "clang" }
-- require("nvim-treesitter.configs").setup({
--   ensure_installed = {
--     "bash",
--     "comment",
--     "css",
--     "html",
--     "javascript",
--     "jsdoc",
--     "json",
--     "lua",
--     "python",
--     "rust",
--     "scss",
--     "typescript",
--     "tsx",
--     "toml",
--     "vue",
--     "yaml",
--   },
--   highlight = { enable = true, use_languagetree = true },
--   incremental_selection = { enable = true },
--   indent = { enable = true },
--   disable = { "c", "ruby" }, -- optional, list of language that will be disabled
--   autopairs = { enable = true },
--   matchup = {
--     enable = true, -- mandatory, false will disable the whole extension
--     disable = { "c", "ruby" }, -- optional, list of language that will be disabled
--   },
--   context_commentstring = {
--     enable = true,
--   },
--   autotag = {
--     enable = true,
--   },
--   playground = {
--     enable = true,
--     disable = {},
--     updatetime = 25,
--     persist_queries = false,
--     keybindings = {
--       toggle_query_editor = "o",
--       toggle_hl_groups = "i",
--       toggle_injected_languages = "t",
--       toggle_anonymous_nodes = "a",
--       toggle_language_display = "I",
--       focus_language = "f",
--       unfocus_language = "F",
--       update = "R",
--       goto_node = "<cr>",
--       show_help = "?",
--     },
--   },
-- })

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "help", "javascript", "typescript", "css", "html", "json", "toml", "yaml", "c", "lua", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
