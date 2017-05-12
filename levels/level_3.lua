local STATECLASS = require("modules/gamestatesClass")

local LEVEL_3 = STATECLASS:set("LEVEL_3")
local _groundY = 100
local int = 3
local isEntity = true

function LEVEL_3.getInt()
	return int
end

function LEVEL_3.preload()

end

function LEVEL_3.load()

end

function LEVEL_3.update(dt)
	ENTITIES.update(dt)
end

function LEVEL_3.draw()
	ENTITIES.draw()
end

function LEVEL_3.keypressed(key)
	ENTITIES.keypressed(key)
end

function LEVEL_3.keyreleased(key)
	ENTITIES.keyreleased(key)
end

function LEVEL_3.exit()
	ENTITIES.destroy()
end

GAMESTATES.insertLevel(LEVEL_3)


return LEVEL_3
