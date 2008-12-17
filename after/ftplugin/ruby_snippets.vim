if !exists('loaded_snippet') || &cp
    finish
endif

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

exec "Snippet do do<CR>".st.et."<CR><BS>end<CR>"
exec "Snippet class class ".st."className".et."<CR>".st.et."<CR>end<CR>".st.et
exec "Snippet begin begin<CR>".st.et."<CR>rescue ".st."Exception".et." => ".st."e".et."<CR>".st.et."<CR>end<CR>".st.et
exec "Snippet each_with_index0 each_with_index do |".st."element".et.", ".st."index".et."|<CR>".st."element".et.".".st.et."<CR>end<CR>".st.et
exec "Snippet collect collect { |".st."element".et."| ".st."element".et.".".st.et." }<CR>".st.et
exec "Snippet forin for ".st."element".et." in ".st."collection".et."<CR>".st."element".et.".".st.et."<CR>end<CR>".st.et
exec "Snippet doo do |".st."object".et."|<CR>".st.et."<CR>end<CR>".st.et
exec "Snippet : :".st."key".et." => \"".st."value".et."\"".st.et
exec "Snippet def def ".st.et."<CR>".st.et."<CR>end<CR>"
exec "Snippet case case ".st."object".et."<CR>when ".st."condition".et."<CR>".st.et."<CR>end<CR>".st.et
exec "Snippet collecto collect do |".st."element".et."|<CR>".st."element".et.".".st.et."<CR>end<CR>".st.et
exec "Snippet ea each { |".st."element".et."| ".st."element".et.".".st.et." }<CR>".st.et
exec "Snippet each_with_index each_with_index { |".st."element".et.", ".st."idx".et."| ".st."element".et.".".st.et." }<CR>".st.et
exec "Snippet if if ".st."condition".et."<CR>".st.et."<CR>end<CR>".st.et
exec "Snippet eacho each do |".st."element".et."|<CR>".st."element".et.".".st.et."<CR>end<CR>".st.et
exec "Snippet unless unless ".st."condition".et."<CR>".st.et."<CR>end<CR>".st.et
exec "Snippet ife if ".st."condition".et."<CR>".st.et."<CR>else<CR>".st.et."<CR>end<CR>".st.et
exec "Snippet when when ".st."condition".et."<CR>".st.et
exec "Snippet selecto select do |".st."element".et."|<CR>".st."element".et.".".st.et."<CR>end<CR>".st.et
exec "Snippet injecto inject(".st."object".et.") do |".st."injection".et.", ".st."element".et."| <CR>".st.et."<CR>end<CR>".st.et
exec "Snippet reject { |".st."element".et."| ".st."element".et.".".st.et." }<CR>".st.et
exec "Snippet rejecto reject do |".st."element".et."| <CR>".st."element".et.".".st.et."<CR>end<CR>".st.et
exec "Snippet inject inject(".st."object".et.") { |".st."injection".et.", ".st."element".et."| ".st.et." }<CR>".st.et
exec "Snippet select select { |".st."element".et."| ".st."element".et.".".st.et." }<CR>".st.et

exec "Snippet patfh File.join(File.dirname(__FILE__), *%w[".st.et."])"
exec "Snippet # #{".st.et."}".st.et
exec "Snippet deb puts \"#{".st.et."}\"".st.et



exec "Snippet it it \"".st."should".et.st.et"\" do<CR><TAB>".st.et."<CR><BS>end"
exec "Snippet bef before(".st.et.") do<CR><TAB>".st.et."<CR><BS>end"
exec "Snippet desc describe \"".st.et."\" do<CR><TAB>".st.et."<CR><BS>end"

