
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

