" MIT License. Copyright (c) 2013 Bailey Ling.
" vim: et ts=2 sts=2 sw=2

let s:prototype = {}

function! s:prototype.split(...)
  let self._side = 0
  let self._line .= '%#'.self._curgroup.'#'.(a:0 ? a:1 : '%=')
endfunction

function! s:prototype.add_section(group, contents)
  if self._curgroup != ''
    if self._curgroup == a:group
      let self._line .= self._side ? g:airline_left_alt_sep : g:airline_right_alt_sep
    else
      call airline#highlighter#add_separator(self._curgroup, a:group, self._side)
      let self._line .= '%#'.self._curgroup.'_to_'.a:group.'#'
      let self._line .= self._side ? g:airline_left_sep : g:airline_right_sep
    endif
  endif

  let self._line .= '%#'.a:group.'#'.a:contents
  let self._curgroup = a:group
endfunction

function! s:prototype.add_raw(text)
  let self._line .= a:text
endfunction

function! s:prototype.build()
  if !self._context.active
    let self._line = substitute(self._line, '%#.\{-}\ze#', '\0_inactive', 'g')
  endif
  return self._line
endfunction

function! airline#builder#new(context)
  let builder = copy(s:prototype)
  let builder._context = a:context
  let builder._side = 1
  let builder._curgroup = ''
  let builder._line = '%{airline#check_mode()}'
  return builder
endfunction

