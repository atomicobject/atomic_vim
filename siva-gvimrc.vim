" gvim-specific options

colorscheme koehler

set guifont=Consolas:h14:cANSI
"FALLBACK: set guifont=Monospace

" Remove toolbar, it sux
set guioptions-=T

" Remove menubar, it sux
set guioptions-=m

" Make silly command abbreviations to toggle toolbar and menubar:
cabbr toff set guioptions-=T
cabbr ton set guioptions+=T
cabbr moff set guioptions-=m
cabbr mon set guioptions+=m

" No bell or visual bell
set vb t_vb=

" No highlight search
set nohlsearch

