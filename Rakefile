task :default do
  Dir.chdir "bundle/optional/ctrlp-cmatcher"
  sh "./install_linux.sh"

  puts <<-EOF
    Add the following lines to your vimrc file:

    call optional#include(['ctrlp-cmatcher'])
    let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
  EOF
end
