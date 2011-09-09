function! RunBackground(command, ...)
  silent execute "!" . a:command . " &"
endfunction

function! RunFileInTerminal()
  if exists("g:vim_terminal")
    let g:run_file = "ruby ~/.vim/tools/run_file_in_terminal.rb " . expand("%")
    call RunBackground("ruby ~/.vim/tools/run_file_in_terminal.rb " . expand("%") . " " . g:vim_terminal, "Running " . expand("%") . "...")
  else
    call RunFile()
  end
endfunction

function! RunFileAtLineInTerminal()
  if exists("g:vim_terminal")
    let g:run_file = "ruby ~/.vim/tools/run_file_at_line_in_terminal.rb " . expand("%") . " " . line(".")
    call RunBackground("ruby ~/.vim/tools/run_file_at_line_in_terminal.rb " . expand("%") . " " . line(".") . " " . g:vim_terminal, "Running " . expand("%") . " at line " . line(".") . "...")
  else
    call RunFileAtLine()
  endif
endfunction

function! ReRunLastFileCommand()
  if exists("g:vim_terminal") && exists("g:run_file")
    call RunBackground(g:run_file . " " . g:vim_terminal, "Running previous command...")
  endif
endfunction

command! -nargs=* -complete=file RunBackground call RunBackground(<q-args>)
command! RunFileInTerminal call RunFileInTerminal()
command! RunFileAtLineInTerminal call RunFileAtLineInTerminal()
command! ReRunLastFileCommand call ReRunLastFileCommand()
