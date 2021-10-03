vim.o.termguicolors = true

vim.g.sonokai_style = "default"
vim.g.sonokai_cursor = "red"
vim.g.sonokai_diagnostic_line_highlight = 1
vim.g.sonokai_diagnostic_virtual_text = "colored"
vim.g.sonokai_better_performance = 1

vim.g.tokyonight_style = "storm"
vim.g.tokyonight_enable_italic = 1

vim.g.ayucolor = "mirage"
-- vim.cmd("colorscheme ayu")
-- vim.cmd("colorscheme sonokai")
-- vim.cmd("colorscheme tokyonight")
-- vim.cmd("colorscheme rose-pine-moon")
-- vim.cmd("colorscheme material")

Colors = {
  bg = "#202328",
  fg = "#CBCCC6",
  yellow = "#ECBE7B",
  cyan = "#008080",
  darkblue = "#081633",
  green = "#98be65",
  orange = "#FF8800",
  violet = "#a9a1e1",
  magenta = "#c678dd",
  blue = "#51afef",
  red = "#ec5f67",
}

-- Set variant
-- Defaults to 'dawn' if vim background is light
-- @usage 'base' | 'moon' | 'dawn' | 'rose-pine[-moon][-dawn]'
vim.g.rose_pine_variant = 'moon'

-- Disable italics
vim.g.rose_pine_disable_italics = false

-- Use terminal background
vim.g.rose_pine_disable_background = false

-- Use bold vertical split line
vim.g.rose_pine_bold_vertical_split_line = true

-- Set colorscheme after options
vim.cmd('colorscheme rose-pine')
