if $0 == __FILE__
  filename = File.expand_path ARGV[0]
  terminal_tty = ARGV[1]

  exec_it = lambda do |command|
    exec "osascript ~/.vim/tools/run_command.scpt '#{command}' #{terminal_tty}"
  end

  # Run it directly
  exec_it.call(filename) if File.executable? filename

  # Run it with shebang
  first_line = File.open(filename){|io| io.gets}
  exec_it.call("#$1 #{filename}") if first_line =~ /^#!\s*(.*)$/

  require 'pathname'
  case filename
  when /_spec\.rb$/
    exec_it.call "bundle exec rspec #{filename}"

  when /\.rb$/
    exec_it.call "ruby #{filename}"

  when /\.feature$/
    exec_it.call "bundle exec cucumber #{filename}"

  else
    puts "Couldn't figure out how to run #{filename}. Edit #{__FILE__}"
  end
end
