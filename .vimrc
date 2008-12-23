:set guifont=Monaco:h12
:set guioptions-=T
let mapleader=","


set nocompatible
set nu
set grepprg=ack
set grepformat=%f:%l:%m

set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set sta
set ai
set si


:noremap <leader>v :vsp^M^W^W<cr>
:noremap <leader>h :split^M^W^W<cr>
:noremap <leader>w /\(<c-r>=expand("<cword>")<cr>\)<CR>
:noremap <leader>a ^
:noremap <leader>e A
:noremap <leader>f :Ack 

set number
set hlsearch
set incsearch
set ignorecase
set smartcase

set nowrap


imap jj <Esc>
imap uu _
imap hh =>
imap aa @
imap its it "should

autocmd FileType ruby,eruby set omnifunc=rubycomplete


colorscheme vividchalk
syntax on
filetype on
filetype plugin on
compiler ruby

let g:fuzzy_ignore = "vendor*"
let g:fuzzy_matching_limit = 70
map <leader>t :FuzzyFinderTextMate<CR>
map <leader>b :FuzzyFinderBuffer<CR>

map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

" Fuzzyfinder *****************************************************************
" Fuzzy finder rocks, like Command-T in TextMate (buggy at moment, fix!!)
"let g:FuzzyFinderOptions = { 'Base':{}, 'Buffer':{}, 'File':{}, 'MruFile':{}, 'FavFile':{}, 'Dir':{}, 'Tag':{}, 'TaggedFile':{}}
"let gf:FuzzyFinderOptions.Base.abbrev_map = { "^Project-" : ["**/"], }
"let g:FuzzyFinderOptions.Base.migemo_support = 0
"let g:FuzzyFinderOptions.File.excluded_path = '\v\~$|\.o$|\.git/|\.DS_Store|\.exe$|\.bak$|\.swp$|((^|[/\\])\.[/\\]$)'

map <leader>/ :TComment<Return>

