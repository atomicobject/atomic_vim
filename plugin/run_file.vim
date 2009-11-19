function! RunFile(args)
  let ruby_command ="ruby ~/.vim/ruby/run_file.rb " . expand("%") . " 2>&1"
  execute "botright sp"
  execute "enew"
  execute "res -10"
  normal ggiRunning...
  execute "redraw!"
  normal ggdG
  execute "r!" . ruby_command . a:args
  execute "setlocal nomodified"
  execute "setlocal readonly"
  normal gg
endfunction

command! -nargs=* -complete=file RunFile call RunFile(<q-args>)
