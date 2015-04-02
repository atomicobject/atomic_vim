set autoread

set nu

" Status line. mostly stolen from A Byte of Vim
set laststatus=2
" set statusline=
" set statusline+=%-3.3n\                      " buffer number
" set statusline+=%f\                          " filename
" set statusline+=%h%m%r%w                     " status flags
" set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
" set statusline+=%{fugitive#statusline()}     " git branch
" set statusline+=%=                           " right align remainder
" set statusline+=0x%-8B                       " character value
" set statusline+=%-14(%l,%c%V%)               " line, character
" set statusline+=%<%P                         " file position

" let g:solarized_termcolors=256
" let g:solarized_termcolors=16
" set background=light
colorscheme solarized
" colorscheme molokai
" colorscheme default

" if has('win32') || has('win64')
"   noremap <leader>s :ConqueTerm cmd<cr>
" else
"   noremap <leader>s :ConqueTerm sh<cr>
" end
"
let g:paredit_leader='\'

let optional = []
let optional += ['vim-easymotion', 'nerdtree', 'tagbar', 'vim-airline', 'vim-vinegar'] " 'syntastic']

call optional#include(optional)


" Run rake to get ctrlp-cmatcher to work
call optional#include(['ctrlp-cmatcher'])
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

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
nnoremap <leader><C-n> :NERDTree<cr>
au BufRead,BufNewFile *.xaml            setfiletype xml

set foldmethod=indent
set foldlevelstart=99

set infercase

let g:airline_powerline_fonts = 0
let g:airline#extensions#default#section_truncate_width = {
    \ 'b': 110,
    \ 'x': 65,
    \ 'y': 100,
    \ 'z': 50,
    \ }

let g:airline#extensions#default#layout = [
      \ [ 'a', 'c' ],
      \ [ 'x', 'b', 'z'] 
      \ ]

let g:ctrlp_max_height = 20

