set autoread


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

" let g:solarized_termcolors=256
let g:solarized_termcolors=16
set background=dark
colorscheme solarized

" if has('win32') || has('win64')
"   noremap <leader>s :ConqueTerm cmd<cr>
" else
"   noremap <leader>s :ConqueTerm sh<cr>
" end
"

let g:paredit_leader='\'

let optional = []
let optional += ["slimv"]
let optional += ["vimclojure"]
call OptionalBundles#Include(optional)

" clojure configuration
let vimclojure#ParenRainbow = 1
let vimclojure#HighlightBuiltins = 1

" Don't let NERDTree hijack the normal Netrw directory browser
let g:NERDTreeHijackNetrw=0

