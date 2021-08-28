-- Load screen
term.setBackgroundColor(backgroundColor)
term.clear()
term.setCursorPos(1,1)
term.write("Loading")

-- Run the os
shell.run("/osmium/home.lua")
