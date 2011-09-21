fun! OptionalBundles#Include(bundles)
  for bundle in a:bundles
    let path = "~/.vim/bundle/optional/*" . bundle . "*"
    let list = pathogen#glob_directories(path)
    let rtp = pathogen#split(&rtp)
    let &rtp = pathogen#join(pathogen#uniq(rtp + list))
  endfor
endfunction

