on appIsRunning(appName)
  tell application "System Events" to (name of processes) contains appName
end appIsRunning

on execInItermTab(_terminal, _session, _command)
  tell application "iTerm"
    activate
    set current terminal to _terminal
    tell _session
      select _session
      write text _command
    end tell
  end tell
end selectTerminalTab

on execInTerminalTab(_window, _tab, _command)
  tell application "Terminal"
    activate
    set frontmost of _window to true
    set selected of _tab to true
    do script _command in _tab
  end
end execInTerminalTab

on run argv
  set _command to item 1 of argv
  set _foundTab to false
  -- If a tty is specified look in both iTerm and Terminal
  if length of argv is 2
    if appIsRunning("iTerm") then
      tell application "iTerm"
        repeat with t in terminals
          tell t
            repeat with s in sessions
              set _tty to (tty of s)
              if _tty = (item 2 of argv) then
                set _foundTab to true
                set _session to s
                set _terminal to t
                exit repeat
              end if
            end repeat
          end tell
          if _foundTab then
            exit repeat
          end if
        end repeat
      end tell
      if _foundTab then
        execInItermTab(_terminal, _session, _command)
      end if
    end if
    if appIsRunning("Terminal") and not _foundTab then
      tell application "Terminal"
        repeat with w in windows
          tell w
            repeat with t in tabs
              set _tty to (tty of t)
              if _tty = (item 2 of argv) then
                set _foundTab to true
                set _window to w
                set _tab to t
                exit repeat
              end if
            end repeat
          end tell
          if _foundTab then
            exit repeat
          end if
        end repeat
      end tell
      if _foundTab then
        execInTerminalTab(_window, _tab, _command)
      end if
    end if
  end if
end run
