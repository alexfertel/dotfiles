vim.o.termguicolors = true

local g = vim.g
g.sonokai_style = "default"
g.sonokai_cursor = "red"
g.sonokai_diagnostic_line_highlight = 1
g.sonokai_diagnostic_virtual_text = "colored"
g.sonokai_better_performance = 1

g.tokyonight_style = "storm"
g.tokyonight_enable_italic = 1
g.airline_theme = "tokyonight"
g.airline_theme = "material"
g.airline_theme = "sonokai"

g.ayucolor = "mirage"

vim.cmd("colorscheme ayu")
-- vim.cmd("colorscheme sonokai")
-- vim.cmd("colorscheme tokyonight")
-- vim.cmd("colorscheme material")
