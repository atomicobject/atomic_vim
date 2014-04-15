" matt: From my personal .vimrc, I source:
" source ~/.vim/common-vimrc.vim
" source ~/.vim/skeletor-vimrc.vim
"
" most of this stolen from Steve Losh
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/

" CRAZY SHIT TO GET THIS WORKING WITH GVIM 7.3-46
" There's some sort of poor interaction between Ruby 1.9.2 and gVim 7.3-46 on
" Windows; out of the box you'll get a weird Gem error.
"
" Hack to fix: edit $VIMRUNTIME/bundle/vim-ruby/ftplugin/ruby.vim file.
" Around line 71 you'll see this:
" if !exists("s:ruby_path")
"   if exists("g:ruby_path")
"
" Before the first if !, put this line:
" let s:ruby_path = 'C:\ruby192\bin'
" Make the path appropriate; that should be the default for Ruby 1.9.2 on
" Windows.
"
" BE VERY VERY CAREFUL ABOUT NOT CHECKING THIS IN AND FUCKING UP EVERYONE
" ELSE'S VIM CONFIG
" It looks like this problem may be fixed as of gVim 7.3-88, but I can't get a
" compiled version of that right now (1/1/2011)
if v:version >= 703
  set nonumber
  set relativenumber
  nnoremap <F4> :NumbersToggle<CR>
endif
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
