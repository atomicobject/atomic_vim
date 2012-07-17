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
if v:version >= 703
  set nonumber
  set relativenumber
endif
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Window split horizontal
noremap <leader>s :split<CR><C-W><C-W>

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

xmap <Leader>s <Plug>Vsurround

" Textmate-style arrows shortcut
imap  <Space>=><Space>
