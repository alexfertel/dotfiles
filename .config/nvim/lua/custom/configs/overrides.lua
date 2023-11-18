local M = {}

M.treesitter = {
  ensure_installed = {
    "bash",
    "c",
    "comment",
    "css",
    "html",
    "javascript",
    "jsdoc",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "python",
    "rust",
    "scss",
    "typescript",
    "tsx",
    "toml",
    "vue",
    "vim",
    "yaml",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    "beautysh",
    "clang-format",
    "clangd",
    "css-lsp",
    "deno",
    "eslint-lsp",
    "html-lsp",
    "lua-language-server",
    "prettier",
    "ruff",
    "rust-analyzer",
    "solidity",
    "solhint",
    "sqlfmt",
    "stylua",
    "typescript-language-server",
  },
}

-- Git support in nvimtree.
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
