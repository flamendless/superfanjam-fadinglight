local STATECLASS = require("modules/gamestatesClass")

local FINISHED = STATECLASS:set("NAME")

function FINISHED.preload()
	local title = "FINISHED"
	local message = "Congrats! You finished the game.\n Sorry for the unexpected quality of the game,\n it's under time pressure since\n it's an entry for a game jam. Please vote the game"
	local buttons = {"EXIT THE GAME","PLAY AGAIN",escapebutton = 2}
	local closeDialog = love.window.showMessageBox(title, message, buttons)
	if closeDialog == 1 then
		love.event.quit()
	elseif closeDialog == 2 then
		GAMESTATES.setState(TITLE)
	end
end

function FINISHED.load()

end

function FINISHED.update(dt)

end

function FINISHED.draw()

end

function FINISHED.keypressed(key)

end

function FINISHED.keyreleased(key)

end

function FINISHED.exit()

end

return FINISHED
