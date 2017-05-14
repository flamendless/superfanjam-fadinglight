local STATECLASS = require("modules/gamestatesClass")

local LEVEL_1 = STATECLASS:set("LEVEL_1")
local _groundY = 80
local int = 1

function LEVEL_1.getInt()
	return int
end

function LEVEL_1.preload()
	ASSETS.preload()
end

function LEVEL_1.load()
	local player = PLAYER(anim_pIdle,16,(_groundY - assets.images.playerSheet:getHeight()),20,_groundY)
	local ground = GROUND(0,_groundY)
	local box = BOX(settings.gameWidth/2, _groundY - 32)
	ENTITIES.insert({box,player,ground})
end

function LEVEL_1.update(dt)
	ENTITIES.update(dt)
end

function LEVEL_1.draw()
	love.graphics.setBackgroundColor(0,0,0,255)
	ENTITIES.draw()
	MISC.print("Press E while moving to move the box")
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

function LEVEL_1.goal()
	local b = ENTITIES.getEntity("BOX")
	return b.x > settings.gameWidth
end

function LEVEL_1.getDeath(dt)
	return false
end

GAMESTATES.insertLevel(LEVEL_1)

return LEVEL_1
