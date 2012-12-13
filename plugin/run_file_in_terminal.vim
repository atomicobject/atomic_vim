function! RunInTerminal(file)
  if match(a:file, '_spec\.rb') != -1
    if exists("g:run_in_terminal_rspec_command")
      let l:command = g:run_in_terminal_rspec_command
    else
      let l:command = 'bundle exec rspec'
    endif
  elseif match(a:file, '\.feature') != -1
    let l:command = 'bundle exec cucumber'
  elseif match(a:file, '\.rb') != -1
    let l:command = 'ruby'
  endif
  if exists("l:command")
    let g:last_run_in_terminal = a:file
    silent execute ":up"
    silent execute "!osascript ~/.vim/tools/run_command.scpt '" . l:command . " " . a:file . "' " . g:vim_terminal . " &"
    silent execute ":redraw!"
  else
    echo "Couldn't figure out how to run " . a:file 
  end
endfunction

function! RunFileInTerminal()
  if exists("g:vim_terminal")
    call RunInTerminal(expand("%")) 
  else
    call RunFile()
  end
endfunction

function! RunFileAtLineInTerminal()
  if exists("g:vim_terminal")
    call RunInTerminal(expand("%") . ":" . line("."))
  else
    call RunFileAtLine()
  endif
endfunction

function! ReRunLastFileCommand()
  if exists("g:vim_terminal") && exists("g:last_run_in_terminal")
    call RunInTerminal(g:last_run_in_terminal)
  endif
endfunction

command! RunFileInTerminal call RunFileInTerminal()
command! RunFileAtLineInTerminal call RunFileAtLineInTerminal()
command! ReRunLastFileCommand call ReRunLastFileCommand()
