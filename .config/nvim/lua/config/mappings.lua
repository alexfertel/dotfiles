-- local wk = load("which-key")
local util = load("util")

-- local presets = load("which-key.plugins.presets")
-- presets.objects["a("] = nil
-- wk.setup({ show_help = false, triggers = "auto", plugins = { spelling = true }, key_labels = { ["<leader>"] = "SPC" } })

-- Map the <leader> key to <space>
-- util.nnoremap("<space>", "<nop>")
vim.g.mapleader = " "

-- Use <c-s> to save the current buffer
util.nnoremap("<c-s>", ":update<cr>", { silent = true })
util.vnoremap("<c-s>", ":<c-c>update<cr>", { silent = true })
util.inoremap("<c-s>", ":<c-o>update<cr>", { silent = true })

-- Use <leader>l to clear the highlighting of :set hlsearch.
vim.cmd([[
if maparg('<leader>l', 'n') ==# ''
  nnoremap <silent> <leader>l :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><leader>l
endif
]])

-- nvim-tree mapppings
util.nnoremap("<leader>ntt", ":NvimTreeToggle<CR>")
util.nnoremap("<leader>ntr", ":NvimTreeRefresh<CR>")
util.nnoremap("<leader>ntn", ":NvimTreeFindFile<CR>")

-- Use ctrl-[hjkl] to select the active split!
util.nmap("<c-k>", ":wincmd k<CR>", { silent = true })
util.nmap("<c-j>", ":wincmd j<CR>", { silent = true })
util.nmap("<c-h>", ":wincmd h<CR>", { silent = true })
util.nmap("<c-l>", ":wincmd l<CR>", { silent = true })

-- Find files using Telescope command-line sugar.
util.nnoremap("<c-p>", "<cmd>Telescope find_files<cr>")
util.nnoremap("<leader>fg", "<cmd>Telescope git_files<cr>")
util.nnoremap("<leader>lg", "<cmd>Telescope live_grep<cr>")
util.nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>")
util.nnoremap("<leader>fh", "<cmd>Telescope help_tags<cr>")
util.nnoremap("<leader>fq", "<cmd>Telescope quickfix<cr>")
util.nnoremap("<leader>fB", "<cmd>Telescope git_branches<cr>")
util.nnoremap("<leader>fc", "<cmd>Telescope lsp_code_actions<cr>")

-- This will reload init.lua from inside nvim
util.nnoremap("<leader>sv", "<cmd>luafile $MYVIMRC<CR>")

-- Remaps Scroll up and down
util.map("", "<m-k>", "<c-u>")
util.map("", "<m-j>", "<c-d>")

-- These commands will move the current buffer backwards or forwards in the bufferline
util.nnoremap("<m-h>", "<cmd>BufferLineCyclePrev<CR>", { silent = true })
util.nnoremap("<m-l>", "<cmd>BufferLineCycleNext<CR>", { silent = true })

-- These commands will sort buffers by directory, language, or a custom criteria
util.nnoremap("<leader>be", "<cmd>BufferLineSortByExtension", { silent = true })
util.nnoremap("<leader>bd", "<cmd>BufferLineSortByDirectory<CR>", { silent = true })

-- Close buffer
util.nnoremap("<M-w>", "<cmd>bp<bar>sp<bar>bn<bar>bd<CR>", { silent = true })

-- makes * and # work on visual mode too.  global function so user mappings can call it.
-- specifying 'raw' for the second argument prevents escaping the result for vimgrep
-- TODO: there's a bug with raw mode.  since we're using @/ to return an unescaped
-- search string, vim's search highlight will be wrong.  Refactor plz.
vim.cmd(
  [[function! VisualStarSearchSet(cmdtype,...)
let temp = @"
normal! gvy
if !a:0 || a:1 != 'raw'
let @" = escape(@", a:cmdtype.'\*')
endif
let @/ = substitute(@", '\n', '\\n', 'g')
let @/ = substitute(@/, '\[', '\\[', 'g')
let @/ = substitute(@/, '\~', '\\~', 'g')
let @/ = substitute(@/, '\.', '\\.', 'g')
let @" = temp
endfunction]],
  false
)

-- replace vim's built-in visual * and # behavior
util.xnoremap("*", ":<C-u>call VisualStarSearchSet('/')<CR>/<C-R>=@/<CR><CR>")
util.xnoremap("#", ":<C-u>call VisualStarSearchSet('?')<CR>?<C-R>=@/<CR><CR>")

-- recursively vimgrep for word under cursor or selection
vim.cmd(
  [[if maparg('<leader>*', 'n') == ''
nnoremap <leader>* :execute 'noautocmd vimgrep /\V' . substitute(escape(expand("<cword>"), '\'), '\n', '\\n', 'g') . '/ **'<CR>
endif
if maparg('<leader>*', 'v') == ''
vnoremap <leader>* :<C-u>call VisualStarSearchSet('/')<CR>:execute 'noautocmd vimgrep /' . @/ . '/ **'<CR>
endif]],
  false
)

-- vim-fugitive remaps
util.nnoremap("<leader>gs", ":<C-u>G<CR>")
util.nnoremap("<leader>gh", ":diffget //2<CR>")
util.nnoremap("<leader>gl", ":diffget //3<CR>")

-- On Neovim the "basic" and "neovim" strategies will run test
-- commands using Neovim's terminal, and leave you in insert mode,
-- so that you can just press "Enter" to close the terminal session and go back to editing.
-- If you want to scroll through the test command output, you'll have to first switch to normal mode.
-- The built-in mapping for exiting terminal insert mode is CTRL-\ CTRL-n,
-- which is difficult to press, so I recommend mapping it to CTRL-o:
util.tmap("<c-o>", "<c-\\><c-n>")

-- Make the experience in the terminal more consistent
util.tnoremap("<Esc>", "<C-\\><C-n>")
util.tnoremap("<C-v><Esc>", "<Esc>")

-- Goyo
util.nnoremap("<leader>go", ":<C-u>Goyo 100+8<CR>")

-- compe config for nvim-autopairs
-- util.inoremap("<c-Space>", "compe#complete()", { silent = true, expr = true })
-- util.inoremap("<c-e>", "compe#close('<C-e>')", { silent = true, expr = true })
-- util.inoremap("<c-f>", "compe#scroll({ 'delta': +4 })", { silent = true, expr = true })
-- util.inoremap("<c-d>", "compe#scroll({ 'delta': -4 })", { silent = true, expr = true })

-- util.imap("<Tab>", "v:lua.tab_complete()", { expr = true })
-- util.imap("<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
-- util.smap("<Tab>", "v:lua.tab_complete()", { expr = true })
-- util.smap("<S-Tab>", "v:lua.s_tab_complete()", { expr = true })

-- util.inoremap(
-- 	"<cr>",
-- 	[[compe#confirm(luaeval("load 'nvim-autopairs'.autopairs_cr()"))]],
-- 	{ silent = true, expr = true }
-- )

-- Copy whole file content
util.nnoremap("ya", [[ <cmd> %y+<CR>]], { silent = true })

-- Move lines up and down
util.vnoremap("J", [[:m '>+1<CR>gv=gv]])
util.vnoremap("K", [[:m '>-2<CR>gv=gv]])

-- restore the session for the current directory
util.nmap("<leader>qs", [[<cmd>lua require("persistence").load()<cr>]])
-- restore the last session
util.nmap("<leader>ql", [[<cmd>lua require("persistence").load({ last=true })<cr>]])
-- stop Persistence => session won't be saved on exit
util.nmap("<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]])

-- yank without the cursor moving to the top of the block
util.vmap("y", "y']")
