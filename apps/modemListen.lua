-- Libraries
local CommonUI = require("/osmium/libs/commonui").new()
local common = require("/osmium/libs/common")

-- Peripherals
local modem = peripheral.find("modem")

-- Config Setup
local confighandle = fs.open("/osmium/config.lua","r")
local config = textutils.unserialiseJSON(confighandle.readAll())
confighandle.close()

-- Color variable setup
local backgroundColor = common.returnColor(config.backgroundColor)
local textColor = common.returnColor(config.textColor)
local accentColor = common.returnColor(config.accentColor)
local tertiaryColor = common.returnColor(config.tertiaryColor)
local tertiaryTextColor = common.returnColor(config.tertiaryTextColor)

CommonUI.ClearScreen(accentColor)
CommonUI.DrawHeader("Listening Channels 1-127", accentColor, textColor, 0)
CommonUI.DrawFooter("Press <Q> to close")

local logWindow = window.create(term.current(),2,3,24,15) -- set up the log window for where to print modem messages


for i=1,127 do
  modem.open(i)
end

local function listen()
  event, side, ch, rch, msg, dist = os.pullEvent("modem_message")
end
local function keyboardWait() -- Wait for keyboard presses
while true do
      local event, key = os.pullEvent("key")
        if key == keys.q then
          for i=1,127 do
            modem.close(i)
          end
        error("",0)
      end
  end
end

term.redirect(logWindow)

term.setTextColor(textColor)
term.setBackgroundColor(backgroundColor)
CommonUI.ClearScreen(backgroundColor)
while true do
  parallel.waitForAny(listen, keyboardWait)

  print("(" .. math.floor(dist) .. ") ".. ch .. " > " .. rch .. " | " .. msg)
end