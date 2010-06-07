function! Run(command, ...)
  botright copen
  setlocal wrap
  setlocal modifiable
  normal ggdG
  :resize 20

  execute "!" . a:command . " 2>&1 | tee ~/.run.out"
  execute "read ~/.run.out"
  setlocal nomodified
  setlocal nomodifiable
endfunction

function! RunFile()
  call Run("ruby ~/.vim/tools/run_file.rb " . expand("%"), "Running " . expand("%") . "...")
endfunction

function! RunFileAtLine()
  call Run("ruby ~/.vim/tools/run_file_at_line.rb " . expand("%") . " " . line("."), "Running " . expand("%") . " at line " . line(".") . "...")
endfunction

command! -nargs=* -complete=file Run call Run(<q-args>)
command! RunFile call RunFile()
command! RunFileAtLine call RunFileAtLine()
