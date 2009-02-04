" usage:
" (the same as ack, except that the path is required)
" examples: 
" :Ack TODO .
" :Ack sub Util.pm
"
function! AORubyRun(args)
  let ruby_output = "~/tmp/.rubyrun.spec_output"
  let ruby_command ="ruby " . expand("%") . " 2>&1 \| tee ". ruby_output
  execute "!" . ruby_command . a:args
  execute "botright sp " . ruby_output
  execute "res -10"
endfunction

command! -nargs=* -complete=file AORubyRun call AORubyRun(<q-args>)
