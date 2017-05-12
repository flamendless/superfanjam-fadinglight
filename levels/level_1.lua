local STATECLASS = require("modules/gamestatesClass")

local LEVEL_1 = STATECLASS:set("LEVEL_1")
local _groundY = 80
local int = 1
local gap = 32
local tile = 16

function LEVEL_1.getInt()
	return int
end

function LEVEL_1.preload()
	ASSETS.preload()
end

function LEVEL_1.load()
	local player = PLAYER(anim_pIdle,16,(_groundY - assets.images.playerSheet:getHeight()),20,_groundY)
	local ground = GROUND(0,_groundY)
	ENTITIES.insert({player,ground})
end

function LEVEL_1.update(dt)
	ENTITIES.update(dt)
end

function LEVEL_1.draw()
	love.graphics.setBackgroundColor(0,0,0,255)
	ENTITIES.draw()
end

function LEVEL_1.keypressed(key)
	ENTITIES.keypressed(key)
end

function LEVEL_1.keyreleased(key)
	ENTITIES.keyreleased(key)
end

function LEVEL_1.exit()
	ENTITIES.destroy()
end

GAMESTATES.insertLevel(LEVEL_1)

return LEVEL_1
