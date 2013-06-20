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

" Buffer navigation: Next and Previous
noremap <C-N> :bn<CR>
noremap <C-P> :bp<CR>

" Search term highlighting on / off: 
noremap <leader>hl :set hlsearch<CR>
noremap <leader>nhl :set nohlsearch<CR>

" Textmate-style arrows shortcut
imap  <Space>=><Space>

" Set search highlighting color:
set hl=l:DiffChange 

" Windowzizms:
"   Run:
map <F5> ,r<CR>
"   Save:
noremap <F2> :w<CR>

" ~/snip is a junk file; call it a customized clipboard
" Write to snip.  Either uses current visual selection, or entire buffer
noremap  \ws :w! ~/snip<cr>
" Read contents of snip into current buffer
noremap  \rs :r ~/snip<cr>
" Edit the snip file
noremap  \es :e ~/snip<cr>
" Append to the snip file
noremap  \as :w! >> ~/snip<cr>

set wrap

" Camel-hump case boundary detection
map ,w cv/[a-z][A-Z^\n^ ^\t^(^[^.^_]<CR>

map <F4> :A
map <F3> :A
map <F2> :A

map <F7> :call VimWriteRoom()<CR>

" let optional = []
" let optional += ["nerdtree"]
" let optional += ["autoclose"]
" call OptionalBundles#Include(optional)

nnoremap <leader>n :NERDTreeToggle<cr>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set gfn=Menlo:h14

