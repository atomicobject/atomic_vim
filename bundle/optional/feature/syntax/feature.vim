if version < 600
	syntax clear
elseif exists("b:current_syntax")
  finish
endif

" make things case sensitive
syn case match

"setlocal iskeyword+=:
syn keyword xStatement Feature Scenario Given When Then And contained

syn match featureContext    /^\s*Feature.*/     contains=xStatement
syn match scenarioContext /^\s*Scenario.*$/ contains=xStatement
syn match givenContext    /^\s*Given.*$/    contains=ALL
syn match whenContext     /^\s*When.*$/     contains=ALL
syn match thenContext     /^\s*Then.*$/     contains=ALL
syn match andContext      /^\s*And.*$/      contains=ALL

" FIXME matches apostrophes, too :(
syn region stringToken start=/'/ skip=/\\'/ end=/'/ contained
syn region dblStringToken start=/"/ skip=/\\"/ end=/"/ contained
" FIXME this matches 
"syn match stringToken /'.+'/ contained

hi link xStatement Statement

hi link featureContext    Title
hi link scenarioContext Title
hi link givenContext    Function
hi link whenContext     Function
hi link thenContext     Function
hi link andContext      Function
hi link stringToken     Question
hi link dblStringToken  Question


let b:current_syntax = "feature"
