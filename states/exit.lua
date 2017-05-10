local STATECLASS = require("modules/gamestatesClass")

local EXIT = STATECLASS:set("EXIT")

function EXIT.preload()
	local title = "Exit"
	local message = "Do You Really Want To Quit?"
	local buttons = {"Yes","No",escapebutton = 2}
	local closeDialog = love.window.showMessageBox(title, message, buttons)
	if closeDialog == 1 then
		love.event.quit()
	elseif closeDialog == 2 then
		GAMESTATES.setState(TITLE)
	end
end

function EXIT.load()
end

function EXIT.update(dt)

end

function EXIT.draw()

end

function EXIT.keypressed(key)

end

function EXIT.keyreleased(key)

end

function EXIT.exit()

end

return EXIT
