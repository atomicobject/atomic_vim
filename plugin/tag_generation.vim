function! RegenTags()
  let exclude_list = join(g:vim_ignore, "|")
  let ext_list = join(g:taggable_extensions, "|")
  execute "! ruby ~/.vim/tools/generate_tags.rb '" . ext_list . "' '". exclude_list ."'"
endfunction

command! RegenTags call RegenTags()|FufRenewCache
