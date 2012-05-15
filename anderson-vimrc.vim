let optional = []
let optional += ["nerdtree"]
let optional += ["tabular"]
let optional += ["webapi-vim"]
let optional += ["gist-vim"]
call OptionalBundles#Include(optional)

set nu
" set list
set listchars=tab:▸\ ,eol:¬,trail:·

" Camel-hump case boundary detection
map ,w cv/[a-z][A-Z^\n^ ^\t^(^[^.^_]<CR>

xmap <Leader>s <Plug>Vsurround

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>A :A<cr>

" let g:solarized_termcolors=16
" colorscheme solarized
colorscheme koehler

" Run the current file. Uses .vim/ruby/run_file_in_terminal.rb
noremap <leader>r :RunFileInTerminal<cr>
noremap <leader>R :RunFileAtLineInTerminal<cr>
map <leader><C-r> :let g:vim_terminal="/dev/ttys000"
noremap <leader>rr :ReRunLastFileCommand<cr>

nnoremap <leader>n :NERDTreeToggle<cr>

autocmd User Rails Rnavcommand fabricator spec/fabricators -suffix=_fabricator.rb -default=model()

map <F4> :A
map <F3> :A

" Micah
xmap <Leader>s <Plug>Vsurround

map <leader>O :NERDTreeFind<cr>
map <leader>d :exec("CocoaDoc ".expand("<cword>"))<CR>

filetype plugin on
set ofu=syntaxcomplete#Complete
