let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

colorscheme molokai
let g:molokai_original=1
let g:rehash256=1
set background=dark
set regexpengine=1

let optional = []
let optional += ["vim-airline", "tagbar"]
call optional#include(optional)

" Relative line numbers
" if v:version >= 703
"   set nonumber
"   set relativenumber
"   nnoremap <F4> :NumbersToggle<CR>
" endif
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set visualbell
set nofoldenable
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
imap  <Space>=><Space>
noremap <F2> :wa<CR>
noremap <F3> :A<CR>

" Shell like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Window split horizontal
noremap <leader>s :split<CR><C-W><C-W>

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

" Disable K looking stuff up
map K <Nop>

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

if has("win32")
  set sh=zsh
endif

" Maintain good git commits!
" http://robots.thoughtbot.com/post/48933156625/5-useful-tips-for-a-better-commit-message
autocmd Filetype gitcommit setlocal spell textwidth=72

" diable surround for 68
" xmap <Leader>s <Plug>Vsurround

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Test-running stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RunCurrentTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFile()

    if match(expand('%'), '\.feature$') != -1
      call SetTestRunner("!cucumber")
      exec g:bjo_test_runner g:bjo_test_file
    elseif match(expand('%'), '_spec\.rb$') != -1
      call SetTestRunner("!rspec")
      exec g:bjo_test_runner g:bjo_test_file
    else
      call SetTestRunner("!ruby -Itest")
      exec g:bjo_test_runner g:bjo_test_file
    endif
  else
    exec g:bjo_test_runner g:bjo_test_file
  endif
endfunction

function! SetTestRunner(runner)
  let g:bjo_test_runner=a:runner
endfunction

function! RunCurrentLineInTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFileWithLine()
  end

  exec "!rspec" g:bjo_test_file . ":" . g:bjo_test_file_line
endfunction

function! SetTestFile()
  let g:bjo_test_file=@%
endfunction

function! SetTestFileWithLine()
  let g:bjo_test_file=@%
  let g:bjo_test_file_line=line(".")
endfunction

function! CorrectTestRunner()
  if match(expand('%'), '\.feature$') != -1
    return "cucumber"
  elseif match(expand('%'), '_spec\.rb$') != -1
    return "rspec"
  else
    return "ruby"
  endif
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

