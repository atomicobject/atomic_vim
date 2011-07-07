set nonu

" Camel-hump case boundary detection
map ,w cv/[a-z][A-Z^\n^ ^\t^(^[^.^_]<CR>

xmap <Leader>s <Plug>Vsurround

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

let g:solarized_termcolors=16
colorscheme solarized
