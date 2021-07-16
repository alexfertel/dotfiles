require 'nvim-treesitter.install'.compilers = { "gcc", "clang" }
require('nvim-treesitter.configs').setup {
    ensure_installed = {
        'bash',
        'comment',
        'css',
        'html',
        'javascript',
        'jsdoc',
        'json',
        'lua',
        'python',
        'rust',
        'scss',
        'typescript',
        'tsx',
        'toml',
        'vue',
        'yaml'
    },
    highlight = { enable = true },
    incremental_selection = { enable = true },
    indent = { enable = true },
    disable = { "c", "ruby" },  -- optional, list of language that will be disabled
    autopairs = { enable = true },
    matchup = {
        enable = true,              -- mandatory, false will disable the whole extension
    },
    playground = {
        enable = true,
        disable = {},
        updatetime = 25,
        persist_queries = false,
        keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
        },
    }
}

