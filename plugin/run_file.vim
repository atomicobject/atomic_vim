" usage:
" (the same as ack, except that the path is required)
" examples: 
" :Ack TODO .
" :Ack sub Util.pm
"
function! RunFile(args)
  let ruby_output = "~/.run.output"
  let ruby_command ="ruby ~/.vim/ruby/run_file.rb " . expand("%") . " 2>&1 \| tee ". ruby_output
  echo ruby_command
  execute "!" . ruby_command . a:args
  execute "botright sp " . ruby_output
  execute "res -10"
endfunction

command! -nargs=* -complete=file RunFile call RunFile(<q-args>)
