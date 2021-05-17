" vim-airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" Show buffer number for easier switching between buffer,
" see https://github.com/vim-airline/vim-airline/issues/1149
let g:airline#extensions#tabline#buffer_nr_show = 1
" Buffer number display format
let g:airline#extensions#tabline#buffer_nr_format = '%s '
" Enable vim-airline extension for vim-lsp
let g:airline#extensions#lsp#enabled = 1
" Skip empty sections if there are nothing to show,
" extracted from https://vi.stackexchange.com/a/9637/15292
let g:airline_skip_empty_sections = 1
" Speed up airline
let g:airline_highlighting_cache = 1

let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-css', 'coc-cssmodules', 'coc-html', 'coc-omnisharp', 'coc-python', 'coc-snippets', 'coc-prettier', 'coc-svg', 'coc-tsserver', 'coc-vimlsp', 'coc-eslint', 'coc-jest']

" Sets labels for `vim-sneak`
let g:sneak#label = 1

let g:startify_change_to_dir = 0

let g:blamer_enabled = 1
let g:blamer_delay = 500
let g:blamer_relative_time = 1
