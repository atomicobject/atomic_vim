source ~/.vim/common-vimrc.vim

au BufNewFile,BufRead *.handlebars set filetype=html
au BufNewFile,BufRead *.hbs set filetype=html
au BufNewFile,BufRead *.hamlbars set filetype=haml

set hls
set ignorecase

noremap <leader>h :split<CR><C-W><C-W>

set background=dark
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

set list
set listchars=trail:☹

nnoremap <C-w>. 20<C-w>>
nnoremap <C-w>> 10<C-w>>
nnoremap <C-w>, 20<C-w><
nnoremap <C-w>< 10<C-w><



let optional = []
let optional += ["nerdtree"]
" let optional += ["autoclose"]
" let optional += ["vim-endwise"]
" let optional += ["tabular"]
" let optional += ["scratch"]
" let optional += ["conque"]
" let optional += ["gundo"]
" let optional += ["cucumber"]
call optional#include(optional)

nnoremap <leader>n :NERDTreeToggle<cr>


nnoremap <leader><space> :noh<cr>

set noswapfile

map <leader>t :CtrlP .<CR>
