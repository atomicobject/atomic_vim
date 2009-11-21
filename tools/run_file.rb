def exec_in_path(command, filename)
  Pathname(File.dirname(filename)).ascend do |dir|
    if File.executable? "#{dir}/#{command}"
      exec "#{dir}/#{command} #{filename}"
    end
  end
end

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
    exec_in_path "script/spec", filename
    exec "spec #{filename}"

  when /\.rb$/
    exec "ruby #{filename}"

  when /\.feature$/
    exec_in_path "script/cucumber", filename
    exec "cucumber #{filename}"

  else
    puts "Couldn't figure out how to run #{filename}. Edit #{__FILE__}"
  end
end
