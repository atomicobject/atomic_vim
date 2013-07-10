if exists("g:vimwriteroom") 
	finish
endif

" Global Varibales used for configuration:
"   g:vimwriteroom = set to disable plugin
"   g:vimwriteroomcolorscheme = colorscheme to show in writeroom mode

let g:vimwriteroom=1
let g:vimwriteroommode=0

function VimWriteRoom ()
	if (g:vimwriteroommode == 0)

		let g:vimwriteroommode=1

		let s:oldlines=&lines
		let s:oldcolumns=&columns
		let s:oldcolorcolumn=&colorcolumn
		let s:oldtextwidth=&textwidth
		let s:oldguioption=&guioptions
		let s:oldfuoptions=&fuoptions
		let s:oldformatoptions=&formatoptions
		let s:oldcolorscheme=g:colors_name
		
		let s:isfu=&fu
		let s:showtabline=&showtabline
		let s:laststatus=&laststatus
		let s:iswrap=&wrap
		let s:islist=&list
		let s:islinebreak=&linebreak
		let s:iscursorline=&cursorline
		let s:isnumber=&number
		let s:isrelativenumber=&relativenumber

		if exists("g:vimwriteroomcolorscheme")
			execute 'colorscheme ' . g:vimwriteroomcolorscheme
		endif

		set lines=999
		set columns=80
		set colorcolumn=0
		set textwidth=80
		set guioptions-=r
		set fuoptions=background:#00000000
		set fu
		set nolist
		set formatoptions=l1
		set wrap
		set linebreak
		set nocursorline
		set nonumber
		set norelativenumber
		set showtabline=0
		set laststatus=0

		" hide ~'s
		hi NonText guifg=bg guibg=bg

		" make k and j navigate display lines
		map k gk
		map j gj
	else
		let g:vimwriteroommode=0
		let &lines=s:oldlines
		let &columns=s:oldcolumns
		let &colorcolumn=s:oldcolorcolumn
		let &textwidth=s:oldtextwidth
		let &guioptions=s:oldguioption
		let &fuoptions=s:oldfuoptions
		let &formatoptions=s:oldformatoptions
		let &showtabline=s:showtabline
		let &laststatus=s:laststatus

		unlet s:oldlines
		unlet s:oldcolumns
		unlet s:oldcolorcolumn
		unlet s:oldtextwidth
		unlet s:oldguioption
		unlet s:oldfuoptions
		unlet s:oldformatoptions
		
		execute 'colorscheme ' . s:oldcolorscheme

		if (s:isfu == 1)
			set fu
		else
			set nofu
		endif

		if (s:iswrap == 1)
			set wrap
		else
			set nowrap
		endif
		
		if (s:islist == 1)
			set list
		else
			set nolist
		endif
		
		if (s:islinebreak == 1)
			set linebreak
		else
			set nolinebreak
		endif
	
		if (s:iscursorline == 1)
			set cursorline
		else
			set nocursorline
		endif
		
		if (s:isnumber == 1)
			set number
		else
			set nonumber
		endif
		
		if (s:isrelativenumber == 1)
			set relativenumber
		else
			set norelativenumber
		endif

		unlet s:isfu
		unlet s:iswrap
		unlet s:islist
		unlet s:islinebreak
		unlet s:iscursorline
		unlet s:isnumber
		unlet s:isrelativenumber

		unmap k
		unmap j
	endif
endfunction

if mapcheck('<F5>') == "" && has('gui_running')
	nnoremap <F5> :call VimWriteRoom()<CR>
endif
