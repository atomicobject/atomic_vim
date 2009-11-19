require 'pathname'

def exec_in_path(command, filename)
  Pathname(File.dirname(filename)).ascend do |dir|
    if File.executable? "#{dir}/#{command}"
      exec "#{dir}/#{command} #{filename}"
    end
  end
end

if $0 == __FILE__
  filename = File.expand_path ARGV[0]
  line_number = ARGV[1]

  filename_lineno = "#{filename}:#{line_number}"

  case filename
  when /_spec\.rb$/
    exec_in_path "script/spec", filename_lineno
    exec "spec #{filename_lineno}"

  when /\.feature$/
    exec_in_path "script/cucumber", filename_lineno
    exec "cucumber #{filename_lineno}"

  else
    puts "Couldn't figure out how to run #{filename} on line #{line_number}. Edit #{__FILE__}"
  end
end
