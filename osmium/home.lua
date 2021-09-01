-- Libraries
local common = require("/osmium/libs/common")
local CommonUI = require("/osmium/libs/commonui").new()

-- Config setup
local confighandle = fs.open("/osmium/config.lua","r")
local config = textutils.unserialiseJSON(confighandle.readAll())
confighandle.close()


-- Color variable setup
common.configColor()

CommonUI.ClearScreen(backgroundColor)

local appWindow = window.create(term.current(),1,5,20,10)

local drawMenu = function ()
  CommonUI:AddAndDrawComponent(
    CommonUI.NewButton(
        "Shut Down",
        2,4,
        false,
        tertiaryColor,
        tertiaryTextColor,
        function()
            os.shutdown()
        end
    )
  )
  CommonUI:AddAndDrawComponent(
    CommonUI.NewButton(
        "Exit to shell",
        2,5,
        false,
        tertiaryColor,
        tertiaryTextColor,
        function()
            term.setBackgroundColor(colors.black)
            term.setTextColor(colors.white)
            term.clear()
            term.setCursorPos(1,1)
            error("Exited to shell, Goodbye!",0)
        end
    )
  )
end
local drawApps = function ()
  local oldTerm = term.current()
  term.redirect(appWindow)
  CommonUI.ClearScreen(backgroundColor)
  for i,o in pairs(fs.list("/apps/")) do
    local cleanName = o:gsub("%.lua", "")
    CommonUI:AddAndDrawComponent(
      CommonUI.NewButton(
        cleanName,  -- Button text
        1, 1+i,         -- x and y position
        false,         -- is the button a big or a small one?
        accentColor, -- background color
        textColor, -- foreground (text) color
        function()    -- gets called when the button is clicked
          --CommonUI.ClearScreen(colors.black)
          shell.openTab("/apps/" .. o)
        end))
  end
  term.redirect(oldTerm)
end


CommonUI.DrawBox(1,1,26,2,accentColor)

CommonUI:AddAndDrawComponent(
    CommonUI.NewButton(
        "O",
        1,1,
        true,
        accentColor,
        textColor,
        function()
            drawMenu()
        end
    )
)

drawApps()

CommonUI:BeginEventLoop()
