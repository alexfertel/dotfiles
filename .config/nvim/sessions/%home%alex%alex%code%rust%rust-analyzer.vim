let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/alex/code/rust/rust-analyzer
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 .
badd +389 crates/rust-analyzer/src/lsp_ext.rs
badd +1 ~/alex/code/rust/rust-analyzer/crates/rust-analyzer/build.rs
badd +23 ~/alex/code/rust/rust-analyzer/crates/rust-analyzer/src/lib.rs
badd +90 ~/.cargo/registry/src/github.com-1ecc6299db9ec823/lsp-types-0.89.2/src/code_action.rs
badd +1 ~/.cargo/registry/src/github.com-1ecc6299db9ec823/lsp-types-0.89.2/src/hover.rs
badd +1 ~/alex/code/rust/rust-analyzer/Cargo.toml
badd +520 crates/rust-analyzer/src/main_loop.rs
badd +889 crates/rust-analyzer/src/handlers.rs
badd +1 crates/rust-analyzer/src/to_proto.rs
badd +63 crates/rust-analyzer/src/from_proto.rs
badd +19 crates/ide/src/matching_brace.rs
badd +432 crates/ide/src/lib.rs
badd +47 crates/base_db/src/lib.rs
badd +60 crates/vfs/src/lib.rs
badd +15 ~/.cargo/registry/src/github.com-1ecc6299db9ec823/text-size-1.1.0/src/range.rs
badd +831 ~/.cargo/registry/src/github.com-1ecc6299db9ec823/lsp-types-0.89.2/src/lib.rs
badd +76 crates/ide/src/hover.rs
argglobal
%argdel
$argadd .
edit crates/ide/src/lib.rs
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 106 + 106) / 213)
exe 'vert 2resize ' . ((&columns * 106 + 106) / 213)
argglobal
balt crates/ide/src/hover.rs
let s:l = 427 - ((19 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 427
normal! 023|
wincmd w
argglobal
if bufexists("crates/rust-analyzer/src/handlers.rs") | buffer crates/rust-analyzer/src/handlers.rs | else | edit crates/rust-analyzer/src/handlers.rs | endif
if &buftype ==# 'terminal'
  silent file crates/rust-analyzer/src/handlers.rs
endif
balt crates/rust-analyzer/src/main_loop.rs
let s:l = 887 - ((31 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 887
normal! 014|
wincmd w
exe 'vert 1resize ' . ((&columns * 106 + 106) / 213)
exe 'vert 2resize ' . ((&columns * 106 + 106) / 213)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0&& getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=xilTOfnoFtcI
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
