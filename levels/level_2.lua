local STATECLASS = require("modules/gamestatesClass")

local LEVEL_2 = STATECLASS:set("LEVEL_2")
local _groundY = 90
local int = 2

function LEVEL_2.getInt()
	return int
end

function LEVEL_2.preload()
	ASSETS.preload()
end

function LEVEL_2.load()
	player = PLAYER(anim_pIdle,16,(_groundY - assets.images.playerSheet:getHeight()),20,_groundY)
	ground = GROUND(0,_groundY)
	ENTITIES.insert({player,ground})
end

function LEVEL_2.update(dt)
	ENTITIES.update(dt)
end

function LEVEL_2.draw()
	ENTITIES.draw()
end

function LEVEL_2.keypressed(key)
	ENTITIES.keypressed(key)
end

function LEVEL_2.keyreleased(key)
	ENTITIES.keyreleased(key)
end

function LEVEL_2.exit()
	ENTITIES.destroy()
end

GAMESTATES.insertLevel(LEVEL_2)


return LEVEL_2
