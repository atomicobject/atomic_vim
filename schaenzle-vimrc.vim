let optional = []
let optional += ["vcscommand"]
let optional += ["nerdtree"]
let optional += ["autoclose"]
let optional += ["vim-endwise"]
let optional += ["vim_multiple_cursors"]
call optional#include(optional)

" call pathogen#runtime_append_all_bundles('optional/slimv')
" call pathogen#runtime_append_all_bundles('optional/vimclojure')
" call pathogen#runtime_append_all_bundles('optional/nerdtree')

colorscheme slate_jts
" Automatically re-read files when they change underneath us on disk
set autoread
" Add a colored column to guide when lines are too long
" set colorcolumn=80
" Use Relative line numbers.  Handy, but distracting.
" set relativenumber
" Keep Some context at the bottom or top of the editor window
set scrolloff=10

" Tabs/Spaces
" set shiftwidth=4 
" set softtabstop=4 
" set tabstop=4 
" set noexpandtab 

 set shiftwidth=2 
 set tabstop=2 
 set expandtab


" Status line. mostly stolen from A Byte of Vim
set laststatus=2
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%{fugitive#statusline()}     " git branch
set statusline+=%=                           " right align remainder
" set statusline+=0x%-8B                       " character value
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P                         " file position
set smartcase
set hlsearch

" tab navigation mappings - may conflict with 't' usage occasionally
map th :tabfirst<CR>
map tj :tabnext<CR>
map tk :tabprev<CR>
map tl :tablast<CR>
map tt :tabedit<Space>
map tn :tabnext<Space>
map tm :tabm<Space>

nnoremap <leader>n :NERDTreeToggle<cr>
let NERDTreeIgnore = ['\.orig$']

" Remnant of Numerical Methods with Fortran
" let fortran_free_source=1
