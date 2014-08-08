
set autoread
set nu
set laststatus=2

" Get the 's' key back
xmap <Leader>s <Plug>Vsurround

set autowrite
set nofoldenable
set wrap
set linebreak

"colorscheme koehler
"colorscheme default
colorscheme molokai

" Buffer navigation: Next and Previous
noremap <C-N> :bn<CR>
noremap <C-P> :bp<CR>

" Textmate-style arrows shortcut
imap  <Space>=><Space>

" Windowzizms:
"   Run:
map <F5> ,r<CR>
"   Save:
noremap <F2> :w<CR>

set wrap

" Camel-hump case boundary detection
" map ,w cv/[a-z][A-Z^\n^ ^\t^(^[^.^_]<CR>

map <F4> :A
map <F3> :A

map <F7> :call VimWriteRoom()<CR>

let optional = []
let optional += ["nerdtree", 'vim-airline']
let optional += ['ctrlp-cmatcher']
let optional += ['vim-rspec']
call optional#include(optional)

let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

" clojure configuration
let vimclojure#ParenRainbow = 1
let vimclojure#HighlightBuiltins = 1

nnoremap <leader>n :NERDTreeToggle<cr>

" RSpec.vim mappings
map <Leader>a :call RunCurrentTestFile()<CR>
map <Leader>r :call RunNearestTest()<CR>
map <Leader>l :call RunLastTest()<CR>
let g:test_runner = "os_x_terminal"

" Search term highlighting on / off: 
noremap <leader>hl :set hlsearch<CR>
noremap <leader>nhl :set nohlsearch<CR>

set gfn=Menlo:h14

:au BufWinEnter * RainbowParenthesesActivate
:au BufWinEnter * RainbowParenthesesLoadRound
:au BufWinEnter * RainbowParenthesesLoadSquare
:au BufWinEnter * RainbowParenthesesLoadBraces

" ~/snip is a junk file; call it a customized clipboard
" Write to snip.  Either uses current visual selection, or entire buffer
noremap  \ws :w! ~/snip<cr>
" Read contents of snip into current buffer
noremap  \rs :r ~/snip<cr>
" Edit the snip file
noremap  \es :e ~/snip<cr>
" Append to the snip file
noremap  \as :w! >> ~/snip<cr>

let g:airline_powerline_fonts = 1
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
