function! Run(command, ...)
  let command = a:command . " 2>&1"
  execute "botright copen"
  setlocal wrap
  setlocal modifiable
  normal ggdG

  if a:0 > 0
    execute "normal ggi" . a:1
  else
    execute "normal ggiRunning " . a:command . "..."
  end

  execute "redraw!"
  normal ggdG
  if has("ruby")
    execute "setlocal paste"
    ruby << EOF
    IO.popen(Vim.evaluate("command")) do |io|
      while !io.eof?
        Vim.command "normal A" + io.readpartial(1000)
        Vim.command("redraw")
      end
    end
EOF
    execute "setlocal nopaste"
  else
    execute "r!" . a:command
  endif
  execute "setlocal nomodified"
  execute "setlocal nomodifiable"
  echo "Done"
endfunction

function! RunFile()
  call Run("ruby ~/.vim/tools/run_file.rb " . expand("%"), "Running " . expand("%") . "...")
endfunction

function! RunFileAtLine()
  call Run("ruby ~/.vim/tools/run_file_at_line.rb " . expand("%") . " " . line("."), "Running " . expand("%") . " at line " . line(".") . "...")
endfunction

command! -nargs=* -complete=file Run call Run(<q-args>)|redraw!
command! RunFile call RunFile()|redraw!
command! RunFileAtLine call RunFileAtLine()|redraw!
