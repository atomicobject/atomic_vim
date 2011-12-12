" slimv-lisp.vim:
"               Lisp filetype plugin for Slimv
" Version:      0.9.2
" Last Change:  20 Oct 2011
" Maintainer:   Tamas Kovacs <kovisoft at gmail dot com>
" License:      This file is placed in the public domain.
"               No warranty, express or implied.
"               *** ***   Use At-Your-Own-Risk!   *** ***
"
" =====================================================================
"
"  Load Once:
if exists("b:did_ftplugin")
    finish
endif

" ---------- Begin part loaded once ----------
if !exists( 'g:slimv_lisp_loaded' )

let g:slimv_lisp_loaded = 1

" Try to autodetect Lisp executable
" Returns list [Lisp executable, Lisp implementation]
function! b:SlimvAutodetect()
    " Check the easy cases
    if executable( 'sbcl' )
        " Steel Bank Common Lisp
        return ['sbcl', 'sbcl']
    endif
    if executable( 'clisp' )
        " Common Lisp
        return ['clisp', 'clisp']
    endif
    if executable( 'gcl' )
        " GNU Common Lisp
        return ['gcl', 'clisp']
    endif
    if executable( 'cmucl' )
        " Carnegie Mellon University Common Lisp
        return ['cmucl', 'cmu']
    endif
    if executable( 'ecl' )
        " Embeddable Common Lisp
        return ['ecl', 'ecl']
    endif
    if executable( 'acl' )
        " Allegro Common Lisp
        return ['acl', 'allegro']
    endif
    if executable( 'mlisp' )
        " Allegro Common Lisp
        return ['mlisp', 'allegro']
    endif
    if executable( 'mlisp8' )
        " Allegro Common Lisp
        return ['mlisp8', 'allegro']
    endif
    if executable( 'alisp' )
        " Allegro Common Lisp
        return ['alisp', 'allegro']
    endif
    if executable( 'alisp8' )
        " Allegro Common Lisp
        return ['alisp8', 'allegro']
    endif
    if executable( 'lwl' )
        " LispWorks
        return ['lwl', 'lispworks']
    endif
    if g:slimv_windows && executable( 'wx86cl' )
        " Clozure CL
        return ['wx86cl', 'clozure']
    endif
    if !g:slimv_windows && executable( 'lx86cl' )
        " Clozure CL
        return ['lx86cl', 'clozure']
    endif

    if g:slimv_windows
        " Try to find Lisp on the standard installation places
        let lisps = split( globpath( 'c:/*lisp*,c:/*lisp*/*,c:/*lisp*/bin/*,c:/Program Files/*lisp*,c:/Program Files/*lisp*/*,c:/Program Files/*lisp*/bin/*', '*lisp.exe' ), '\n' )
        if len( lisps ) > 0
            return [lisps[0], 'clisp']
        endif
        let lisps = split( globpath( 'c:/gcl*,c:/Program Files/gcl*', 'gcl.exe' ), '\n' )
        if len( lisps ) > 0
            return [lisps[0], 'clisp']
        endif
        let lisps = split( globpath( 'c:/cmucl*,c:/Program Files/cmucl*', 'cmucl.exe' ), '\n' )
        if len( lisps ) > 0
            return [lisps[0], 'cmu']
        endif
        let lisps = split( globpath( 'c:/sbcl*,c:/Program Files/sbcl*,c:/Program Files/*lisp*/bin/sbcl*', 'sbcl.exe' ), '\n' )
        if len( lisps ) > 0
            return [lisps[0], 'sbcl']
        endif
        let lisps = split( globpath( 'c:/acl*,c:/Program Files/acl*,c:/Program Files/*lisp*/bin/acl*', '*lisp*.exe' ), '\n' )
        if len( lisps ) > 0
            return [lisps[0], 'allegro']
        endif
        let lisps = split( globpath( 'c:/ecl*,c:/Program Files/ecl*', 'ecl.exe' ), '\n' )
        if len( lisps ) > 0
            return [lisps[0], 'ecl']
        endif
        let lisps = split( globpath( 'c:/ccl*,c:/Program Files/ccl*,c:/Program Files/*lisp*/bin/ccl*', 'wx86cl.exe' ), '\n' )
        if len( lisps ) > 0
            return [lisps[0], 'clozure']
        endif
    endif

    return ['', '']
endfunction

" Try to find out the Lisp implementation
function! b:SlimvImplementation()
    if exists( 'g:slimv_impl' ) && g:slimv_impl != ''
        " Return Lisp implementation if defined
        return tolower( g:slimv_impl )
    endif

    if exists( 'g:slimv_lisp' ) && match( tolower( g:slimv_lisp ), 'sbcl' ) >= 0
        return 'sbcl'
    endif

    return 'clisp'
endfunction

" Filetype specific initialization for the REPL buffer
function! b:SlimvInitRepl()
    set filetype=lisp
endfunction

" Lookup symbol in the list of Lisp Hyperspec symbol databases
function! b:SlimvHyperspecLookup( word, exact, all )
    if !exists( 'g:slimv_clhs_loaded' )
        runtime ftplugin/**/slimv-clhs.vim
    endif

    let symbol = []
    if exists( 'g:slimv_clhs_loaded' )
        let symbol = SlimvFindSymbol( a:word, a:exact, a:all, g:slimv_clhs_clhs,          g:slimv_clhs_root, symbol )
        let symbol = SlimvFindSymbol( a:word, a:exact, a:all, g:slimv_clhs_issues,        g:slimv_clhs_root, symbol )
        let symbol = SlimvFindSymbol( a:word, a:exact, a:all, g:slimv_clhs_chapters,      g:slimv_clhs_root, symbol )
        let symbol = SlimvFindSymbol( a:word, a:exact, a:all, g:slimv_clhs_control_chars, g:slimv_clhs_root, symbol )
        let symbol = SlimvFindSymbol( a:word, a:exact, a:all, g:slimv_clhs_macro_chars,   g:slimv_clhs_root, symbol )
        let symbol = SlimvFindSymbol( a:word, a:exact, a:all, g:slimv_clhs_loop,          g:slimv_clhs_root, symbol )
        let symbol = SlimvFindSymbol( a:word, a:exact, a:all, g:slimv_clhs_arguments,     g:slimv_clhs_root, symbol )
        let symbol = SlimvFindSymbol( a:word, a:exact, a:all, g:slimv_clhs_glossary,      g:slimv_clhs_root, symbol )
    endif
    if exists( 'g:slimv_clhs_user_db' )
        " Give a choice for the user to extend the symbol database
        if exists( 'g:slimv_clhs_user_root' )
            let user_root = g:slimv_clhs_user_root
        else
            let user_root = ''
        endif
        let symbol = SlimvFindSymbol( a:word, a:exact, a:all, g:slimv_clhs_user_db, user_root, symbol )
    endif
    return symbol
endfunction

" Source Slimv general part
runtime ftplugin/**/slimv.vim

endif "!exists( 'g:slimv_lisp_loaded' )
" ---------- End of part loaded once ----------

runtime ftplugin/**/lisp.vim

" Must be called for each lisp buffer
call SlimvInitBuffer()

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

