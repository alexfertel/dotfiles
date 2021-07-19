vim.g.vsnip_filetypes = {
  typescriptreact = { "typescript" },
  javascriptreact = { "typescript" },
  javascript = { "typescript" },
  typescript = { "typescript" },
}

require("compe").setup({
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = "always",
  throttle_time = 80,
  source_timeout = 200,
  resolve_timeout = 800,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = {
    border = { "", "", "", " ", "", "", "", " " }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  },
  source = {
    path = true,
    buffer = true,
    vsnip = true,
    calc = true,
    nvim_lsp = true,
    nvim_lua = true,
    treesitter = true,
  },
})

local t = require("util").t

local check_back_space = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t("<C-n>")
  elseif vim.fn["vsnip#available"](1) == 1 then
    return t("<Plug>(vsnip-expand-or-jump)")
  elseif check_back_space() then
    return t("<Tab>")
  else
    return vim.fn["compe#complete"]()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t("<C-p>")
  elseif vim.fn["vsnip#jumpable"](-1) == 1 then
    return t("<Plug>(vsnip-jump-prev)")
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t("<S-Tab>")
  end
end
