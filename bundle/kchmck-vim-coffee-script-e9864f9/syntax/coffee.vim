" Language:    CoffeeScript
" Maintainer:  Mick Koch <kchmck@gmail.com>
" URL:         http://github.com/kchmck/vim-coffee-script
" License:     WTFPL

if exists("b:current_syntax")
  finish
endif

if version < 600
  syntax clear
endif

let b:current_syntax = "coffee"

" CoffeeScript allows dollar signs in identifiers
setlocal isident+=$

syntax keyword coffeeStatement return break continue throw
highlight default link coffeeStatement Statement

syntax keyword coffeeRepeat for while until
highlight default link coffeeRepeat Repeat

syntax keyword coffeeConditional if else unless switch when then
highlight default link coffeeConditional Conditional

syntax keyword coffeeException try catch finally
highlight default link coffeeException Exception

syntax keyword coffeeOperator instanceof typeof delete
highlight default link coffeeOperator Operator

syntax keyword coffeeKeyword new in of by where and or not is isnt
\                            class extends super
highlight default link coffeeKeyword Keyword

syntax keyword coffeeBoolean true on yes false off no
highlight default link coffeeBoolean Boolean

syntax keyword coffeeGlobal null undefined
highlight default link coffeeGlobal Type

syntax keyword coffeeVar this prototype arguments
syntax match coffeeVar /@\%(\I\i*\)\?/
highlight default link coffeeVar Type

" Matches class-like names that start with a capital letter, like Array or
" Object
syntax match coffeeObject /\<\u\w*\>/
highlight default link coffeeObject Structure

" Matches constant-like names in SCREAMING_CAPS
syntax match coffeeConstant /\<\u[A-Z0-9_]\+\>/
highlight default link coffeeConstant Constant

syntax match coffeePrototype /::/
highlight default link coffeePrototype SpecialChar

" What can make up a variable name
syntax cluster coffeeIdentifier contains=coffeeVar,coffeeObject,coffeeConstant,
\                                        coffeePrototype

syntax match coffeeAssignmentChar /:/ contained
highlight default link coffeeAssignmentChar SpecialChar

syntax match coffeeAssignment /@\?\I\%(\i\|::\|\.\)*\s*::\@!/
\                             contains=@coffeeIdentifier,coffeeAssignmentChar
highlight default link coffeeAssignment Identifier

syntax match coffeeFunction /->/
syntax match coffeeFunction /=>/
syntax match coffeeFunction /<-/
highlight default link coffeeFunction Function

syntax keyword coffeeTodo TODO FIXME XXX contained
highlight default link coffeeTodo Todo

syntax match coffeeComment /#.*/ contains=@Spell,coffeeTodo
highlight default link coffeeComment Comment

syntax region coffeeEmbed start=/`/ end=/`/
highlight default link coffeeEmbed Special

" Matches numbers like -10, -10e8, -10E8, 10, 10e8, 10E8
syntax match coffeeNumber /\<-\?\d\+\%([eE][+-]\?\d\+\)\?\>/
" Matches hex numbers like 0xfff, 0x000
syntax match coffeeNumber /\<0[xX]\x\+\>/
highlight default link coffeeNumber Number

" Matches floating-point numbers like -10.42e8, 10.42e-8
syntax match coffeeFloat /\<-\?\d\+\.\d\+\%([eE][+-]\?\d\+\)\?/
highlight default link coffeeFloat Float

syntax region coffeeInterpolation matchgroup=coffeeInterpDelim
\                                 start=/\${/ end=/}/
\                                 contained contains=TOP
highlight default link coffeeInterpDelim Delimiter

syntax match coffeeInterpSimple /\$@\?\K\%(\k\|\.\)*/ contained
highlight default link coffeeInterpSimple Identifier

syntax match coffeeEscape /\\\d\d\d\|\\x\x\{2\}\|\\u\x\{4\}\|\\./ contained
highlight default link coffeeEscape SpecialChar

syntax cluster coffeeSimpleString contains=@Spell,coffeeEscape
syntax cluster coffeeInterpString contains=@coffeeSimpleString,coffeeInterpSimple,
\                                          coffeeInterpolation

syntax region coffeeRegExp start=/\// skip=/\\\// end=/\/[gimy]\{,4}/ oneline
\                          contains=@coffeeInterpString
highlight default link coffeeRegExp String

syntax region coffeeString start=/"/ skip=/\\\\\|\\"/ end=/"/ contains=@coffeeInterpString
syntax region coffeeString start=/'/ skip=/\\\\\|\\'/ end=/'/ contains=@coffeeSimpleString
highlight default link coffeeString String

syntax region coffeeHeredoc start=/"""/ end=/"""/ contains=@coffeeInterpString
syntax region coffeeHeredoc start=/'''/ end=/'''/ contains=@coffeeSimpleString
highlight default link coffeeHeredoc String

" Displays an error for trailing whitespace
syntax match coffeeSpaceError /\s\+$/ display
highlight default link coffeeSpaceError Error

" Displays an error for trailing semicolons
syntax match coffeeSemicolonError /;$/ display
highlight default link coffeeSemicolonError Error

" Displays an error for reserved words
syntax keyword coffeeReservedError case default do function var void with const
\                                  let enum export import native
highlight default link coffeeReservedError Error
