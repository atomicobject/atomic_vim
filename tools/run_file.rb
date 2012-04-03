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
    exec_in_path "bin/rspec", filename
    exec "rake spec:just file=\"#{filename}\""

  when /\.rb$/
    exec "ruby #{filename}"

  when /\.feature$/
    exec_in_path "script/cucumber", filename
    exec "cucumber #{filename}"

  when /spec\.(coffee|js)$/
    puts "vows --spec --no-color \"#{filename}\""
    exec "vows --spec --no-color \"#{filename}\""

  else
    puts "Couldn't figure out how to run #{filename}. Edit #{__FILE__}"
  end
end
