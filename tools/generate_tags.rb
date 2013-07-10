require 'set'
require 'find'
require 'fileutils'

def run(cmd)
  puts cmd
  system cmd
end

tag_file = "tags"
extensions = ARGV[0]
extension_regexp = /\.(#{extensions})$/
excludes = ARGV[1].gsub("|.", "|")
exclude_regexp = /^\..*\/\.|\b(#{excludes})\b/

# old way of generating tags - here for reference in case the new technique
# using Ruby's Find doesn't work out
# run %(find . | egrep '\.(#{extensions})$' | egrep -v '\\b(#{excludes})\\b' | xargs ctags -f #{tag_file})
puts "Generating tags..."
files_to_tag = []
Find.find "." do |path|
  if File.directory?(path) and path =~ exclude_regexp
    puts "pruning #{path}"
    Find.prune
  elsif path =~ extension_regexp
    files_to_tag << path
  else; next
  end
end

dotctags_file = File.expand_path(File.join(File.dirname(__FILE__),"dotctags"))

# For some reason ctags started keeping entries that are no longer valid.
# Let's just start fresh.
File.delete tag_file if File.exist? tag_file

run "ctags --options='#{dotctags_file}' -f #{tag_file} #{files_to_tag.map{|s| "'#{s}'"}.join(' ')}"
FileUtils.touch tag_file

# ctags doesn't generate anything for empty files, so manually jam them into the tags file
puts "Adding missing files..."
included = Set.new
File.open tag_file, "r" do |io|
  io.each_line do |line|
    begin 
      parts = line.split("\t")
      included << parts[1]
    rescue Exception => e
      puts "FAIL LINE: #{line}"
      puts e.message
      puts e.backtrace.join("\n\t")
    end
  end
end

File.open tag_file, "a" do |io|
  files_to_tag.each do |path|
    path = path[2..-1] if path =~ %r{^\./} && !included.include?(path)
    io.puts %(#{path}\t#{path}\t//;"\tf) if path =~ extension_regexp && !included.include?(path)
  end
end

run "sort #{tag_file} --output=#{tag_file}"

puts "Done."
