set autoread

set nonu

" Status line. mostly stolen from A Byte of Vim
set laststatus=2
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%{fugitive#statusline()}     " git branch
set statusline+=%=                           " right align remainder
set statusline+=0x%-8B                       " character value
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P                         " file position

set background=dark
let g:base16colorspace=256
let g:base16_shell_path='~/.config/base16-shell/'
colorscheme base16-tomorrow

let g:paredit_leader='\'

let optional = []
" let optional += ["vim-easymotion", "nerdtree", "vim-airline", "tagbar"]
" let optional += ["vim-easymotion", "nerdtree", "tagbar"]
let optional += ['vim-easymotion', 'tagbar', 'nerdtree', 'vim-vinegar', 'syntastic']
call optional#include(optional)

" clojure configuration
let vimclojure#ParenRainbow = 1
let vimclojure#HighlightBuiltins = 1

" Don't let NERDTree hijack the normal Netrw directory browser
let g:NERDTreeHijackNetrw=0

set list
set listchars=extends:>,precedes:<,trail:·,tab:»\·

map <leader>b :CtrlPBuffer<CR>

nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>N :NERDTreeFind<cr>
au BufRead,BufNewFile *.xaml            setfiletype xml

if has('nvim')
  tnoremap <A-h> <C-\><C-n><C-w>h
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-l> <C-\><C-n><C-w>l
  tnoremap <A-"> <C-\><C-n>:sp<cr>
  tnoremap <A-%> <C-\><C-n>:vsp<cr>
  tnoremap <A-`> <C-\><C-n>
endif
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
nnoremap <A-"> :sp<cr>
nnoremap <A-%> :vsp<cr>

