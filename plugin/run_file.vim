" usage:
" (the same as ack, except that the path is required)
" examples: 
" :Ack TODO .
" :Ack sub Util.pm

function! RunFile(args)
  let ruby_output = "~/.run.output"
  let ruby_command ="ruby ~/.vim/ruby/run_file.rb " . expand("%") . " 2>&1"
  execute "botright sp"
  execute "enew"
  execute "r!" . ruby_command . a:args
  execute "setlocal nomodified"
  execute "setlocal readonly"
  execute "res -10"
  execute "execute line(0)"
endfunction

command! -nargs=* -complete=file RunFile call RunFile(<q-args>)
