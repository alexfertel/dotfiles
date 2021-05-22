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

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <c-space> to trigger completion.
" nnoremap <silent><nowait> <c-space> :<C-u>CocAction<CR>    

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" I don't really know if I'll ever need to format
" just a section of the code instead of the whole
" file.
" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

" augroup mygroup

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" I don't really use these, not even sure what they're supposed to do.
" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <leader>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
" nnoremap <silent><nowait> <leader>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <leader>cc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <leader>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <leader>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <leader>p  :<C-u>CocListResume<CR>
" Run `eslint src` in the current project and populate the
" quickfix list with the results. Notice that the `src` arg
" comes from the CocConfig.
nnoremap <silent><nowait> <leader>el  :<C-u>CocCommand eslint.lintProject<CR>

" Prettier remaps to format a file
vnoremap <silent><nowait> <leader>i :<C-u>Prettier<CR>    
nnoremap <silent><nowait> <leader>i :<C-u>Prettier<CR>    

" Run jest for current test
nnoremap <leader>te :call CocAction('runCommand', 'jest.singleTest')<CR>
" Run jest for current file
nnoremap <leader>tf :call CocAction('runCommand', 'jest.fileTest', ['%'])<CR>
" Run jest for current file
nnoremap <leader>tp :call CocAction('runCommand', 'jest.projectTest')<CR>

" Find files using Telescope command-line sugar.
nnoremap <c-p> <cmd>Telescope git_files<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fq <cmd>Telescope quickfix<cr>
nnoremap <leader>fB <cmd>Telescope git_branches<cr>

" NERDTree mapppings
" nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>

" nvim-tree mapppings
nnoremap <leader>t :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

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

