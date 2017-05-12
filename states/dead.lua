local STATECLASS = require("modules/gamestatesClass")

local GAMEOVER = STATECLASS:set("GAMEOVER")
local int = 0

function GAMEOVER.getInt()
	return int
end

function GAMEOVER.preload()
	ASSETS.preload()
end

function GAMEOVER.load()

end

function GAMEOVER.update(dt)

end

function GAMEOVER.draw()

end

function GAMEOVER.keypressed(key)

end

function GAMEOVER.keyreleased(key)

end

function GAMEOVER.exit()

end

return GAMEOVER
