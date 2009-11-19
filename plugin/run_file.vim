function! RunFile_Execify(command)
  execute "botright sp"
  execute "enew"
  execute "res -10"
  normal ggiRunning...
  execute "redraw!"
  normal ggdG
  execute "r!" . a:command
  execute "setlocal nomodified"
  execute "setlocal readonly"
  normal gg
endfunction

function! RunFile(args)
  call RunFile_Execify("ruby ~/.vim/ruby/run_file.rb " . expand("%") . " 2>&1")
endfunction

function! RunFileAtLine(args)
  call RunFile_Execify("ruby ~/.vim/ruby/run_file_at_line.rb " . expand("%") . " " . line(".") . " 2>&1")
endfunction

command! -nargs=0 -complete=file RunFile call RunFile(<q-args>)
command! -nargs=0 -complete=file RunFileAtLine call RunFileAtLine(<q-args>)
