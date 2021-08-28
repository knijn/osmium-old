local backgroundColor = colors.black
local overlayColor = colors.gray
local accentColor = colors.cyan
local textColor = colors.white
-- Load screen
term.setBackgroundColor(backgroundColor)
term.clear()
term.setCursorPos(1,1)
term.write("Loading")

-- Setup base vars
local screenWidth, screenHeight = term.getSize()
local screen = term.current()

-- Setup windows for things
local infoBar = window.create(screen,1,1,screenWidth,1)

-- Functions
local function setupColors()
  infoBar.setBackgroundColor(overlayColor)
  infoBar.clear()
end

local function setupIcons()
  infoBar.setCursorPos(1,1)
  local oldColor = infoBar.getTextColor()
  infoBar.setTextColor(accentColor)
  infoBar.write("*")
  infoBar.setTextColor(oldColor)
end


local function init()
  setupColors()
  setupIcons()
end

-- Run the os
init()
shell.run("home")
