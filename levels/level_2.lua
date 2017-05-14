local STATECLASS = require("modules/gamestatesClass")

local LEVEL_2 = STATECLASS:set("LEVEL_2")
local _groundY = 90
local int = 2
local dead_count = 0

function LEVEL_2.getInt()
	return int
end

function LEVEL_2.preload()
	ASSETS.preload()
end

function LEVEL_2.load()
	local player = PLAYER(anim_pIdle,16,(_groundY - assets.images.playerSheet:getHeight()),20,_groundY)
	local ground = GROUND(0,_groundY)
	ENTITIES.insert({player,ground})

	spawnTimer = TIMER.new()
	spawnTimer:every(2, function()
		local stone = STONE(settings.gameWidth, _groundY - 8)
		ENTITIES.append(stone)
	end)
end

function LEVEL_2.update(dt)
	ENTITIES.update(dt)
	spawnTimer:update(dt)
	
	for k,v in pairs(ENTITIES.getList()) do
		if v:getTag() == "STONE" then
			if v.x < 0 then
				ENTITIES.remove(k)
			end
		end
	end
end

function LEVEL_2.draw()
	ENTITIES.draw()
	if dead_count ~= 0 then
		love.graphics.setColor(255,0,0,255)
		love.graphics.line(20,20,40,20)
	end
	MISC.print("In Limbo, you don't die")
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

function LEVEL_2.goal()
	local p = ENTITIES.getEntity("PLAYER")
	return p.x > settings.gameWidth
end

GAMESTATES.insertLevel(LEVEL_2)


return LEVEL_2
