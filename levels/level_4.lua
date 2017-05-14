local STATECLASS = require("modules/gamestatesClass")

local LEVEL_4 = STATECLASS:set("LEVEL_4")
local int = 4

function LEVEL_4.getInt()
	return int
end

function LEVEL_4.preload()

end

function LEVEL_4.load()

end

function LEVEL_4.update(dt)
	ENTITIES.update(dt)
end

function LEVEL_4.draw()
	ENTITIES.draw()
end

function LEVEL_4.keypressed(key)
	ENTITIES.keypressed(key)
end

function LEVEL_4.keyreleased(key)
	ENTITIES.keyreleased(key)
end

function LEVEL_4.exit()
	ENTITIES.destroy()
end

GAMESTATES.insertLevel(LEVEL_4)

return LEVEL_4
