function! RunBackground(command, ...)
  silent execute "!" . a:command . " &"
endfunction

function! RunFileInTerminal()
  call RunBackground("ruby ~/.vim/tools/run_file_in_terminal.rb " . expand("%") . " " . g:vim_terminal, "Running " . expand("%") . "...")
endfunction

function! RunFileAtLineInTerminal()
  call RunBackground("ruby ~/.vim/tools/run_file_at_line_in_terminal.rb " . expand("%") . " " . line(".") . " " . g:vim_terminal, "Running " . expand("%") . " at line " . line(".") . "...")
endfunction

command! -nargs=* -complete=file RunBackground call RunBackground(<q-args>)
command! RunFileInTerminal call RunFileInTerminal()
command! RunFileAtLineInTerminal call RunFileAtLineInTerminal()
