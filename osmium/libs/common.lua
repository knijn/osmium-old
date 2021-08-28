common = {}

common.returnColor = function (color) -- Only way I can think of
  if color == "white" then
    return colors.white
  elseif color == "orange" then
    return colors.orange
  elseif color == "magenta" then
    return colors.magenta
  elseif color == "lightBlue" then
    return colors.lightBlue
  elseif color == "yellow" then
    return colors.yellow
  elseif color == "lime" then
    return colors.lime
  elseif color == "pink" then
    return colors.pink
  elseif color == "gray" then
    return colors.gray
  elseif color == "grey" then
    return colors.gray
  elseif color == "lightGray" then
    return colors.lightGray
  elseif color == "lightGrey" then
    return colors.lightGray
  elseif color == "cyan" then
    return colors.cyan
  elseif color == "purple" then
    return colors.purple
  elseif color == "blue" then
    return colors.blue
  elseif color == "brown" then
    return colors.brown
  elseif color == "green" then
    return colors.green
  elseif color == "red" then
    return colors.red
  elseif color == "black" then
    return colors.black
  end
end

common.listen = function ()
  -- A modem channel must be opened to use this
  local event, side, ch, rch, msg, dist = os.pullEvent("modem_message")
  return ch,rch,msg,dist
end

return common