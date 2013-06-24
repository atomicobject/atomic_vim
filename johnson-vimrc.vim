let optional = []
" let optional += ["slimv"]
" let optional += ["vimclojure"]
let optional += ["YouCompleteMe"]
let optional += ["nerdtree"]
call optional#include(optional)

" Automatically re-read files when they change underneath us on disk
set autoread
" Add a colored column to guide when lines are too long
" set colorcolumn=80
" Use Relative line numbers.  Handy, but distracting.
" set relativenumber
" Keep Some context at the bottom or top of the editor window
set scrolloff=5

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

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['white',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

" Booo microline literal tabs.
" set noexpandtab

" tab navigation mappings - may conflict with 't' usage occasionally
map th :tabfirst<CR>
map tj :tabnext<CR>
map tk :tabprev<CR>
map tl :tablast<CR>
map tt :tabedit<Space>
map tn :tabnext<Space>
map tm :tabm<Space>

nnoremap <leader>n :NERDTreeToggle<cr>

" if !exists('g:pyclewn_args')
"     let g:pyclewn_args="--pgm=arm-none-eabi-gdb"
" endif

" Remnant of Numerical Methods with Fortran
" let fortran_free_source=1
