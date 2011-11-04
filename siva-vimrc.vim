"crosby: From my personal .vimrc, I source:
"  source ~/.vim/common-vimrc.vim
"  source ~/.vim/crosby-vimrc.vim

let optional = []
let optional += ["nerdtree"]
let optional += ["vim-endwise"]
call OptionalBundles#Include(optional)

set autowrite
set nofoldenable

colorscheme synic

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
imap  <Space>=>
imap  "([^"]+)"
" Set search highlighting color:
set hl=l:DiffChange 
" Quick search and replace in Visual mode by using Control+R
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
" Quickly delete a word using Control+Backspace
inoremap <C-BS> <C-O>b<C-O>dw
noremap <C-BS> bdw
" Save all open buffers
noremap <F2> :wa<CR>
" Change to corresponding spec file
map <F3> :A

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

" NERDTree toggle
nmap <silent> <C-D> :NERDTreeToggle<CR>

let clj_want_gorilla = 1
syntax on
filetype plugin indent on


" Textmate-style arrows shortcut
imap  <Space>=><Space>

:set hlsearch

" ERB renders like HTML
if has("autocmd")
  au BufRead,BufNewFile *.erb set filetype=eruby
endif

if has('gui_running')
  set guifont=Anonymous:h14
endif
