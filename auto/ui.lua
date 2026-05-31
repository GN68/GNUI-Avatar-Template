
if not host:isHost() then return end
local GNUI = require("lib.GNUI.init")
local screen = GNUI.getScreen()

--────  UI Code  ────────────────────────────────────────────────────────--


if true then
	--- parent box to hold all the columns
	local classColumns = screen:parse({
		style = "opaque",
		layout = "HORIZONTAL",
		gap = 5,
		padding = vec(3,3,3,3),
	})

	-- loop for each class with a given style
	for _, className in ipairs(GNUI.Theme.getClassNames()) do
		-- create a column container for each widget
		local variantColumn = classColumns:parse({
			layout = "VERTICAL",
			sizing = { "FIT", "FIT" },
			minSize = vec(80, 0),
			gap = 5,
		})

		-- create the class header
		local classHeader = variantColumn:parse({
			sizing = { "FILL", "FIT" },
			minSize = vec(0, 15),
			text = className,
			style = "opaque",
		})

		-- loop for each class variant
		for _, variantName in ipairs(GNUI.Theme.getVariantNames(className)) do
			-- create that given widget with the given variant
			local widget = variantColumn:parse({
				type = className,
				sizing = { "FILL", "FIT" },
				style = variantName,
				text = variantName,
			})

			--if className == "button" then
			--	widget.PRESSED:register(function ()
			--		widget:free()
			--	end)
			--end
		end
	end
	classColumns:setPos(5, 5)
end


--────  GNUI Boilerplate  ────────────────────────────────────────────────────────--
-- TODO: make all this boilerplate code a loadable preset instead
events.KEY_PRESS:register(function(key, state)
	local cancel = screen:inputKey(key, state)
	if cancel then
		host:setChatText("")
	end
	return cancel
end)

events.CHAR_TYPED:register(function(char, modifiers, codepoint) screen:inputChar(char) end)
events.MOUSE_PRESS:register(function(button, state) screen:inputMouse(button, state) end)
events.MOUSE_SCROLL:register(function(amount) screen:inputScroll(amount, 0) end)

function events.WORLD_RENDER()
	local screenID = host:getScreen()
	if (action_wheel:isEnabled() or screenID) and not screenID == "net.minecraft.class_408" then -- move mouse away if theres already UI open
		screen:setCursorPos(-1000, -1000)
	else
		screen:setCursorPos(client:getMousePos() *
			(client:getScaledWindowSize() / client:getWindowSize()))
	end
	screen:flushUpdates()
end

screen.display:setParentType("HUD")