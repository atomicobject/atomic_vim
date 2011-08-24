"crosby: From my personal .vimrc, I source:
"  source ~/.vim/common-vimrc.vim
"  source ~/.vim/crosby-vimrc.vim

" Get the 's' key back
xmap <Leader>s <Plug>Vsurround

set autowrite
set nofoldenable

"set nonu
"colorscheme koehler

" Tidy (cheap shot; would like a better plugin)
cabbr tidy %!tidy -q -i -ashtml<CR>

" Croz can't type:
iabbr descrube describe

" Window horizontal split 
noremap <leader>h :split<CR><C-W><C-W>

" Buffer navigation: Next and Previous
noremap <C-N> :bn<CR>
noremap <C-P> :bp<CR>
noremap ,<Space> :set nohlsearch

" Search term highlighting on / off: 
noremap <leader>hl :set hlsearch<CR>
noremap <leader>nhl :set nohlsearch<CR>

" Faster Ctrl+W+hjkl by taking W out
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Textmate-style arrows shortcut
imap  <Space>=><Space>

" Set search highlighting color:
set hl=l:DiffChange 

" Windowzizms:
"   Run:
map <F5> ,r<CR>
"   Save:
noremap <F2> :wa<CR>

" ~/snip is a junk file; call it a customized clipboard
" Write to snip.  Either uses current visual selection, or entire buffer
noremap  \ws :w! ~/snip<cr>
" Read contents of snip into current buffer
noremap  \rs :r ~/snip<cr>
" Edit the snip file
noremap  \es :e ~/snip<cr>
" Append to the snip file
noremap  \as :w! >> ~/snip<cr>
nnoremap <leader><space> :noh<cr>
:set incsearch
:set autowrite

let clj_want_gorilla = 1
syntax on
filetype plugin indent on


" Textmate-style arrows shortcut
imap  <Space>=><Space>

map <F4> :A
map <F3> :A

:set hlsearch
" :set nohlsearch

" ERB renders like HTML
if has("autocmd")
  au BufRead,BufNewFile *.erb set filetype=eruby
endif

if has('gui_running')
  set guifont=Anonymous:h14
endif
