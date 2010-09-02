" NOTE: You must, of course, install the ack script
"       in your path.
" On Ubuntu:
"   sudo apt-get install ack-grep
"   ln -s /usr/bin/ack-grep /usr/bin/ack
" With MacPorts:
"   sudo port install p5-app-ack

let g:ackprg="~/.vim/tools/ack\\ -H\\ --nocolor\\ --nogroup\\ -a"

function! Ack(args)
    let grepprg_bak=&grepprg
    exec "set grepprg=" . g:ackprg
    execute "silent! grep " . a:args
    botright copen
    let &grepprg=grepprg_bak
    exec "redraw!"
endfunction

function! AckWithIgnore(args)
    let grepprg_bak=&grepprg

    if exists('g:ack_ignore')
      exec "set grepprg=" . g:ackprg . "\\ " . join(map(copy(g:ack_ignore), '"--ignore-dir=" . v:val . ""'), "\\ ")
    else
      exec "set grepprg=" . g:ackprg
    endif

    execute "silent! grep " . a:args
    botright copen
    let &grepprg=grepprg_bak
    exec "redraw!"
endfunction

function! AckAdd(args)
    let grepprg_bak=&grepprg
    exec "set grepprg=" . g:ackprg
    execute "silent! grepadd " . a:args
    botright copen
    let &grepprg=grepprg_bak
    exec "redraw!"
endfunction

function! LAck(args)
    let grepprg_bak=&grepprg
    exec "set grepprg=" . g:ackprg
    execute "silent! lgrep " . a:args
    botright lopen
    let &grepprg=grepprg_bak
    exec "redraw!"
endfunction

function! LAckAdd(args)
    let grepprg_bak=&grepprg
    exec "set grepprg=" . g:ackprg
    execute "silent! lgrepadd " . a:args
    botright lopen
    let &grepprg=grepprg_bak
    exec "redraw!"
endfunction

command! -nargs=* -complete=file Ack call Ack(<q-args>)
command! -nargs=* -complete=file AckWithIgnore call AckWithIgnore(<q-args>)
command! -nargs=* -complete=file AckAdd call AckAdd(<q-args>)
command! -nargs=* -complete=file LAck call LAck(<q-args>)
command! -nargs=* -complete=file LAckAdd call LAckAdd(<q-args>)
