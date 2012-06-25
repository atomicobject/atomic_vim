if $0 == __FILE__
  filename = File.expand_path ARGV[0]
  line_number = ARGV[1]
  terminal_tty = ARGV[2]

  filename_lineno = "#{filename}:#{line_number}"

  exec_it = lambda do |command|
    exec "osascript ~/.vim/tools/run_command.scpt '#{command}' #{terminal_tty}"
  end

  case filename
  when /_spec\.rb$/
    exec_it.call "bundle exec rspec #{filename_lineno}"

  when /\.feature$/
    exec_it.call "bundle exec cucumber #{filename_lineno}"

  else
    puts "Couldn't figure out how to run #{filename} on line #{line_number}. Edit #{__FILE__}"
  end
end
