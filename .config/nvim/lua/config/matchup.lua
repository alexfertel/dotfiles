-- Disable unnecessary match stuff
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1

vim.g.matchup_surround_enabled = 1

local highlight = "hi MatchParen guifg=" .. Colors.magenta .. " gui=italic\n"
local cmd = [[
augroup matchup_matchparen_highlight
  autocmd!
  autocmd ColorScheme * ]] .. highlight .. [[
augroup END
]]

vim.cmd(cmd)
