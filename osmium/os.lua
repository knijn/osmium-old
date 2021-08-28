-- Load screen
term.setBackgroundColor(colors.black)
term.clear()
term.setCursorPos(1,1)
term.write("Loading")

-- Run the os
shell.run("/osmium/home.lua")
