set nocompatible

set grepprg=ack
set grepformat=%f:%l:%m

set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set sta
set ai
set si

:noremap ,v :vsp^M^W^W<cr>
:noremap ,h :split^M^W^W<cr>

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


colorscheme ir_black
syntax on
filetype on
filetype plugin on
compiler ruby

let g:fuzzy_ignore = "*.log"
let g:fuzzy_matching_limit = 70
map ,t :FuzzyFinderTextMate<CR>

map ,d :execute 'NERDTreeToggle ' . getcwd()<CR>

" Fuzzyfinder *****************************************************************
" Fuzzy finder rocks, like Command-T in TextMate (buggy at moment, fix!!)
"let g:FuzzyFinderOptions = { 'Base':{}, 'Buffer':{}, 'File':{}, 'MruFile':{}, 'FavFile':{}, 'Dir':{}, 'Tag':{}, 'TaggedFile':{}}
"let gf:FuzzyFinderOptions.Base.abbrev_map = { "^Project-" : ["**/"], }
"let g:FuzzyFinderOptions.Base.migemo_support = 0
"let g:FuzzyFinderOptions.File.excluded_path = '\v\~$|\.o$|\.git/|\.DS_Store|\.exe$|\.bak$|\.swp$|((^|[/\\])\.[/\\]$)'

