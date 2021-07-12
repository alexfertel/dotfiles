" Map the <Leader> key to <SPACE>
nnoremap <SPACE> <Nop>
let mapleader=" "

" Use <C-s> to save the current buffer.
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" Use <leader>l to clear the highlighting of :set hlsearch.
if maparg('<leader>l', 'n') ==# ''
  nnoremap <silent> <leader>l :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><leader>l
endif

" Prettier remaps to format a file
vnoremap <silent><nowait> <leader>i :<C-u>Prettier<CR>    
nnoremap <silent><nowait> <leader>i :<C-u>Prettier<CR>    

" vim-test mappings
" nmap <silent> <leader>rtn :TestNearest<CR>
" nmap <silent> <leader>rtf :TestFile<CR>
" nmap <silent> <leader>rts :TestSuite<CR>
" nmap <silent> <leader>rtl :TestLast<CR>
" nmap <silent> <leader>rtg :TestVisit<CR>

" On Neovim the "basic" and "neovim" strategies will run test 
" commands using Neovim's terminal, and leave you in insert mode,
" so that you can just press "Enter" to close the terminal session and go back to editing.
" If you want to scroll through the test command output, you'll have to first switch to normal mode.
" The built-in mapping for exiting terminal insert mode is CTRL-\ CTRL-n,
" which is difficult to press, so I recommend mapping it to CTRL-o:
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif

" Find files using Telescope command-line sugar.
nnoremap <c-p> <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope git_files<cr>
nnoremap <leader>lg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fq <cmd>Telescope quickfix<cr>
nnoremap <leader>fB <cmd>Telescope git_branches<cr>
nnoremap <leader>fc <cmd>Telescope lsp_code_actions<cr>

" NERDTree mapppings
" nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>

" nvim-tree mapppings
nnoremap <leader>ntt :NvimTreeToggle<CR>
nnoremap <leader>ntr :NvimTreeRefresh<CR>
nnoremap <leader>ntn :NvimTreeFindFile<CR>

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" This will reload init.vim from inside nvim
nnoremap <leader>sv :source $MYVIMRC<CR>

" Remaps Scroll up and down
map <M-k> <C-u>
map <M-j> <C-d>

" Close buffer/tab
" nnoremap <silent> <M-w> :bd <CR>

" " Next buffer
" nnoremap <silent> <M-l> :bn <CR>
" nnoremap <silent> <M-h> :bp <CR>

" Move to previous/next
nnoremap <silent>    <M-h> :BufferPrevious<CR>
nnoremap <silent>    <M-l> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <M-<> :BufferMovePrevious<CR>
nnoremap <silent>    <M->> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <M-1> :BufferGoto 1<CR>
nnoremap <silent>    <M-2> :BufferGoto 2<CR>
nnoremap <silent>    <M-3> :BufferGoto 3<CR>
nnoremap <silent>    <M-4> :BufferGoto 4<CR>
nnoremap <silent>    <M-5> :BufferGoto 5<CR>
nnoremap <silent>    <M-6> :BufferGoto 6<CR>
nnoremap <silent>    <M-7> :BufferGoto 7<CR>
nnoremap <silent>    <M-8> :BufferGoto 8<CR>
nnoremap <silent>    <M-9> :BufferLast<CR>
" Close buffer
nnoremap <silent>    <M-w> :BufferClose<CR>
nnoremap <silent>    <M-t> :lua require('tree').open()<CR>
nnoremap <silent>    <C-t> :lua require('tree').close()<CR>

" Wipeout buffer
"                          :BufferWipeout<CR>
" Close commands
"                          :BufferCloseAllButCurrent<CR>
"                          :BufferCloseBuffersLeft<CR>
"                          :BufferCloseBuffersRight<CR>
" Magic buffer-picking mode
" nnoremap <silent> <C-s>    :BufferPick<CR>
" Sort automatically by...
" nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
" nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>

" From http://got-ravings.blogspot.com/2008/07/vim-pr0n-visual-search-mappings.html

" makes * and # work on visual mode too.  global function so user mappings can call it.
" specifying 'raw' for the second argument prevents escaping the result for vimgrep
" TODO: there's a bug with raw mode.  since we're using @/ to return an unescaped
" search string, vim's search highlight will be wrong.  Refactor plz.
function! VisualStarSearchSet(cmdtype,...)
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
endfunction

" replace vim's built-in visual * and # behavior
xnoremap * :<C-u>call VisualStarSearchSet('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call VisualStarSearchSet('?')<CR>?<C-R>=@/<CR><CR>

" recursively vimgrep for word under cursor or selection
if maparg('<leader>*', 'n') == ''
  nnoremap <leader>* :execute 'noautocmd vimgrep /\V' . substitute(escape(expand("<cword>"), '\'), '\n', '\\n', 'g') . '/ **'<CR>
endif
if maparg('<leader>*', 'v') == ''
  vnoremap <leader>* :<C-u>call VisualStarSearchSet('/')<CR>:execute 'noautocmd vimgrep /' . @/ . '/ **'<CR>
endif

" vim-fugitive remaps
nnoremap <leader>gs :<C-u>G<CR>
nnoremap <leader>gh :diffget //2<CR>
nnoremap <leader>gl :diffget //3<CR>

" Make the experience in the terminal more consisten
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
    tnoremap <C-v><Esc> <Esc>
endif

" Goyo remaps
nnoremap <leader>go :<C-u>Goyo 100+8<CR>

" compe config for nvim-autopairs
inoremap <silent><expr> <C-Space> compe#complete()
" inoremap <silent><expr> <CR>      compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()"))
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
