" gvim-specific options

":highlight Normal guifg=white guibg=black
:colorscheme koehler
":set guifont=kana14
":set guifont=-schumacher-clean-medium-r-normal-*-*-140-*-*-c-*-iso646.1991-irv
":set guifont=-*-fixed-medium-r-normal--14-*-*-*-*-*-*-*,*-r-*
":set guifont=Lucida\ Console\ 11
":set guifont=Monospace
":cabbr font1 set guifont=-*-fixed-medium-r-normal--12-*-*-*-*-*-*-*,*-r-*
:cabbr font1 set guifont=-*-courier-*-r-*-*-10-*-*-*-*-*-*-*
":cabbr font2 set guifont=Monospace

" Remove toolbar, it sux
:set guioptions-=T
"
:set guioptions-=m
" Remove menubar
":set guioptions-=m
:cabbr toff set guioptions-=T
:cabbr ton set guioptions+=T
:cabbr moff set guioptions-=m
:cabbr mon set guioptions+=m

" Remove some toolbar items:
":aunmenu ToolBar.RunScript
":aunmenu ToolBar.RunCtags
":aunmenu ToolBar.Shell
":aunmenu ToolBar.TagJump
":aunmenu ToolBar.Help
":aunmenu ToolBar.-sep7-
":aunmenu ToolBar.FindHelp


"Add some items:
":amenu ToolBar.RunJava :qjjr<CR>
":amenu ToolBar.WWOn :set wrap<CR>
":amenu ToolBar.WWOff :set nowrap<CR>

:set vb t_vb=
:set nohlsearch
