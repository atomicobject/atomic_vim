function! Run(command, ...)
  botright copen
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
    cmd = Vim.evaluate("a:command")
    run_file = "/tmp/vim_run_#{Process.pid}_#{Time.now.to_i}"

    require 'fileutils'
    FileUtils.rm run_file if File.exist? run_file

    pid_read, pid_write = IO.pipe

    fork {
      fork {
        pid_read.close
        pid_write.puts(Process.pid)
        pid_write.close
        Process.setsid
        File.umask(0)
        IO.for_fd(0).close
        (3..1024).each {|i| IO.for_fd(i).close rescue nil }
        exec cmd + " >#{run_file} 2>&1"
      }
      exit(0)
    }

    pid_write.close
    child_process = pid_read.read.to_i
    pid_read.close

    sleep 0.1 until File.exist?(run_file)

    io = File.open run_file, "r"
    until `ps aux`.grep(/\b#{child_process}\b/).empty? && io.eof?
      text = io.readpartial(1000) rescue nil
      if text
        Vim.command "normal A" + text 
        Vim.command("redraw")
      end
      sleep 0.25
    end

    FileUtils.rm run_file
EOF
    setlocal nopaste
  else
    execute "r!" . a:command
  endif
  setlocal nomodified
  setlocal nomodifiable
  echo "Done"
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
