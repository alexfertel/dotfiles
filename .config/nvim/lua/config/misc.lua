require("colorizer").setup()

-- Makes * and # work on visual mode too.
vim.cmd(
	[[
  function! g:VSetSearch(cmdtype)
    let temp = @s
    norm! gv--sy
    let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
    let @s = temp
  endfunction
  xnoremap * :<C-u>call g:VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
  xnoremap # :<C-u>call g:VSetSearch('?')<CR>?<C-R>=@/<CR><CR>
]],
	false
)

-- Enable vim-airline extension for vim-lsp
vim.g["airline#extensions#lsp#enabled"] = 1
-- Skip empty sections if there are nothing to show,
-- extracted from https://vi.stackexchange.com/a/9637/15292
vim.g.airline_skip_empty_sections = 1
-- Speed up airline
vim.g.airline_highlighting_cache = 1

vim.g.startify_change_to_dir = 0

vim.g.blamer_enabled = 1
vim.g.blamer_delay = 500
vim.g.blamer_relative_time = 1

vim.g.vimsyn_embed = "l"

-- make test commands execute using dispatch.vim
vim.g["test#strategy"] = "neovim"
vim.g["test#neovim#term_position"] = "vertical belowright"
