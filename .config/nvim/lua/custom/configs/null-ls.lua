local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {
  b.formatting.clang_format,
  b.formatting.deno_fmt.with {
    filetypes = { "javascript", "javascriptreact", "json", "jsonc", "markdown", "typescript", "typescriptreact" },
  },
  b.formatting.prettier.with {
    filetypes = { "vue", "css", "scss", "less", "html", "yaml", "markdown.mdx", "graphql", "handlebars" },
  },
  b.formatting.ruff,
  b.formatting.rustfmt,
  b.formatting.stylua,
  b.formatting.beautysh,

  b.code_actions.eslint,

  b.diagnostics.eslint,
  b.diagnostics.solhint,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- Make sure we format on save asynchronously.
local on_attach = function(client, bufnr)
  if client.supports_method "textDocument/formatting" then
    vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format()
      end,
    })
  end
end

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = on_attach,
}
