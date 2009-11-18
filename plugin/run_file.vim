function! RunFile(args)
  let ruby_command ="ruby ~/.vim/ruby/run_file.rb " . expand("%") . " 2>&1"
  execute "botright sp"
  execute "enew"
  execute "res -10"
  execute "redraw!"
  execute "r!" . ruby_command . a:args
  execute "setlocal nomodified"
  execute "setlocal readonly"
  execute "execute line(0)"
endfunction

command! -nargs=* -complete=file RunFile call RunFile(<q-args>)
