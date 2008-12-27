runtime syntax/ruby.vim
setlocal filetype=

syntax match specOutputError +.*Error.*\n+ contains=ALL
syntax match specOutputPending +Pending:.*\n.*\n+
syntax match specOutputfailure +.*FAILED\n.*\n.*\n+

syntax match specOutputSummaryExamples +^[\d].*examples,+
syntax match specOutputSummaryFailures +^[\d].*failures,+
syntax match specOutputSummaryPending +^[\d].*pending+

highlight link specOutputError Comment 
highlight link specOutputPending Identifier 
highlight link specOutputFailure Statement  

highlight link specOutputSummaryExamples Special
highlight link specOutputSummaryPending Identifier
highlight link specOutputSummaryFailures Statement
