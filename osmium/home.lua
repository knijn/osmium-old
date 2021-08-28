local backgroundColor = colors.black
local overlayColor = colors.gray
local accentColor = colors.cyan
local textColor = colors.white

term.setBackgroundColor(backgroundColor)
term.setTextColor(textColor)
term.setCursorPos(1,2)

local files = fs.list("/")
for i,o in pairs(files) do
  if fs.isDir(o) then
    local oldColor = term.getTextColor()
    term.setTextColor(accentColor)
    print(i .. " - " .. o)
    term.setTextColor(oldColor)
    return
  end
  print(i .. " - " .. o)
end
