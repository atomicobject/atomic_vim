on appIsRunning(appName)
  tell application "System Events" to (name of processes) contains appName
end appIsRunning

on run argv
  set _command to item 1 of argv
  if appIsRunning("iTerm") then
    tell application "iTerm"
      set _terminal to the first terminal
      set _session to the first session of _terminal
      if length of argv is 2
        repeat with t in terminals
          tell t
            repeat with s in sessions
              set session_id to (tty of s)
              if session_id = (item 2 of argv) then
                set _session to s
                set _terminal to t
              end if
            end repeat
          end tell
        end repeat
      end if
      activate
      set current terminal to _terminal
      tell _session
        select _session
        write text _command
      end tell
    end tell
  else
    tell application "Terminal"
      set _tab to the first tab of windows
      set _window to the first window
      if length of argv is 2
        repeat with w in windows
          tell w
            repeat with t in tabs
              set _tty to (tty of t)
              if _tty = (item 2 of argv) then
                set _window to w
                set _tab to t
              end if
            end repeat
          end tell
        end repeat
      end if
      activate
      set frontmost of _window to true
      set selected of _tab to true
      do script _command in _tab
    end tell
  end if
end run
