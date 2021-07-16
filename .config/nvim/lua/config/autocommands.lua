vim.cmd([[
" Sometimes syntax highlighting for these files is broken
" especially for very large files, so just do it every time
" we open these kind of files.
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" Create a new Ex command named `:Help` that
" opens the help window as a vertical split instead of above the current
" buffer.
command -nargs=* -complete=help Help vertical belowright help <args>

" " Exit Vim if NERDTree is the only window left.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
"     \ quit | endif

" " If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
" autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
"     \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Automatically wrap at 100 characters and spell check git commit messages
autocmd FileType gitcommit setlocal textwidth=100
autocmd FileType gitcommit setlocal spell

" Enable spellchecking for Markdown
autocmd FileType markdown setlocal spell

" Enabling Limelight to be tied to Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Show available code actions using a bulb icon when holding the cursor
" in the current line
autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
]])
