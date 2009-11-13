if $0 == __FILE__
  filename = File.expand_path ARGV[0]

  # Run it directly
  exec filename if File.executable? filename

  # Run it with shebang
  first_line = File.open(filename){|io| io.gets}
  exec "#$1 #{filename}" if first_line =~ /^#!\s*(.*)$/

  require 'pathname'
  case filename
  when /_spec\.rb$/
    Pathname(File.dirname(filename)).ascend do |dir|
      if File.executable? "#{dir}/script/spec"
        exec "#{dir}/script/spec #{filename}"
      end
    end
    exec "spec #{filename}"

  when /\.rb$/
    exec "ruby #{filename}"

  else
    puts "Couldn't figure out how to run #{filename}. Edit #{__FILE__}"
  end
end
