require 'set'
require 'find'
require 'fileutils'

tag_file = "tags"
extensions = ARGV[0]
extension_regexp = /\.(#{extensions})$/
excludes = ARGV[1]
exclude_regexp = /^\..*\/\.|\b(#{excludes})\b/

puts "Generating tags..."
system %(find . | egrep '\.(#{extensions})$' | egrep -v '\\b(#{excludes})\\b' | xargs ctags -f #{tag_file})
FileUtils.touch tag_file

puts "Adding missing files..."
included = Set.new
File.open tag_file, "r" do |io|
  io.each_line do |line|
    parts = line.split("\t")
    included << parts[1]
  end
end

File.open tag_file, "a" do |io|
  Find.find "." do |path|
    if File.directory? path
      if path =~ exclude_regexp
        puts "pruning #{path}"
        Find.prune 
      end
    else
      io.puts %(#{path[2..-1]}\t#{path}\t//;"\tf) if path =~ extension_regexp && !included.include?(path)
    end
  end
end

system "sort #{tag_file} --output=#{tag_file}"

puts "Done."
