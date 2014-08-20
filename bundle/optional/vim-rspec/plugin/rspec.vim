let s:plugin_path = expand("<sfile>:p:h:h")

if !exists("g:test_runner")
  let g:test_runner = "os_x_terminal"
endif

if !exists("g:rspec_command")
  let s:cmd = "rspec {path}"

  " if has("gui_running") && has("gui_macvim")
    let g:rspec_command = "!" . s:plugin_path . "/bin/" . g:test_runner . " '" . s:cmd . "'"
  " elseif has("win32") && fnamemodify(&shell, ':t') ==? "cmd.exe"
  "   let g:rspec_command = "!cls && echo " . s:cmd . " && " . s:cmd
  " else
  "   let g:rspec_command = "!clear && echo " . s:cmd . " && " . s:cmd
  " endif
endif

if !exists("g:cucumber_command")
  let s:cmd = "cucumber {path}"

  " if has("gui_running") && has("gui_macvim")
    let g:cucumber_command = "!" . s:plugin_path . "/bin/" . g:test_runner . " '" . s:cmd . "'"
  " elseif has("win32") && fnamemodify(&shell, ':t') ==? "cmd.exe"
  "   let g:cucumber_command = "!cls && echo " . s:cmd . " && " . s:cmd
  " else
  "   let g:cucumber_command = "!clear && echo " . s:cmd . " && " . s:cmd
  " endif
endif

" function! RunAllTests()
"   let l:spec = "spec"
"   call SetLastTestCommand(l:spec)
"   call RunSpecs(l:spec)
" endfunction

function! RunCurrentTestFile()
  if InSpecFile()
    let l:command = BuildSpecCommand(@%)
    call SetLastTestCommand(l:command)
    call RunTests(l:command)
  elseif InCucFile()
    let l:command = BuildCucCommand(@%)
    call SetLastTestCommand(l:command)
    call RunTests(l:command)
  endif
endfunction

function! RunNearestTest()
  if InSpecFile()
    let l:command = BuildSpecCommand(@% . ":" . line("."))
    call SetLastTestCommand(l:command)
    call RunTests(l:command)
  elseif InCucFile()
    let l:command = BuildCucCommand(@% . ":" . line("."))
    call SetLastTestCommand(l:command)
    call RunTests(l:command)
  endif
endfunction

function! RunLastTest()
  if exists("s:last_test_command")
    call RunTests(s:last_test_command)
  endif
endfunction

function! BuildSpecCommand(path)
  return substitute(g:rspec_command, "{path}", a:path, "g")
endfunction

function! BuildCucCommand(path)
  return substitute(g:cucumber_command, "{path}", a:path, "g")
endfunction


function! InSpecFile()
  return match(expand("%"), "_spec.rb$") != -1
endfunction

function! InCucFile()
  return match(expand("%"), ".feature$") != -1
endfunction

function! SetLastTestCommand(command)
  let s:last_test_command = a:command
endfunction

function! RunTests(command)
  silent execute a:command | redraw!
endfunction
