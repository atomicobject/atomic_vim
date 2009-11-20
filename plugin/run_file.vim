function! RunFile_Execify(command, message)
  execute "botright sp"
  execute "enew"
  execute "res -10"
  execute "normal ggi" . a:message
  execute "redraw!"
  normal ggdG
  if has("ruby")
    ruby << EOF
    IO.popen(Vim.evaluate("a:command")) do |io|
      until io.eof?
        Vim.command "normal A" + io.readpartial(1000)
        Vim.command("redraw")
      end
    end
EOF
  else
    execute "r!" . a:command
  endif
  execute "setlocal nomodified"
  execute "setlocal readonly"
  echo "Done"
endfunction

function! RunFile()
  call RunFile_Execify("ruby ~/.vim/ruby/run_file.rb " . expand("%") . " 2>&1", "Running " . expand("%") . "...")
endfunction

function! RunFileAtLine()
  call RunFile_Execify("ruby ~/.vim/ruby/run_file_at_line.rb " . expand("%") . " " . line(".") . " 2>&1", "Running " . expand("%") . " at line " . line(".") . "...")
endfunction

command! RunFile call RunFile()
command! RunFileAtLine call RunFileAtLine()
