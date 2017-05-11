local STATECLASS = require("modules/gamestatesClass")

local UNFINISHED = STATECLASS:set("UNFINISHED")

function UNFINISHED.preload()

	ASSETS.preload()
end

function UNFINISHED.load()

end

function UNFINISHED.update(dt)

end

function UNFINISHED.draw()
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(assets.images.unfinished,0,0)
end

function UNFINISHED.keypressed(key)
	if key == keybindings.KEY_ESCAPE then
		GAMESTATES.setState(TITLE)
	end
end

function UNFINISHED.keyreleased(key)

end

function UNFINISHED.exit()

end

return UNFINISHED
