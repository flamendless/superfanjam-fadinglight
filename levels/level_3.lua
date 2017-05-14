local STATECLASS = require("modules/gamestatesClass")

local LEVEL_3 = STATECLASS:set("LEVEL_3")
local _groundY = 100
local int = 3

function LEVEL_3.getInt()
	return int
end

function LEVEL_3.preload()
	ASSETS.preload()
end

function LEVEL_3.load()
	local player = PLAYER(anim_pIdle,16,(_groundY - assets.images.playerSheet:getHeight()),20,_groundY)
	local ground = GROUND(0,_groundY)
	ENTITIES.insert({player,ground})

	javTimer = TIMER.new()
	javTimer:every(0.5, function()
		local p = ENTITIES.getEntity("PLAYER")
		local javelin = JAVELIN(math.random(0,settings.gameWidth),
			-8, p.x, p.y, 100)
		ENTITIES.append(javelin)
	end)
end

function LEVEL_3.update(dt)
	ENTITIES.update(dt)
	javTimer:update(dt)

	for k,v in pairs(ENTITIES.getList()) do
		if v:getTag() == "JAVELIN" then
			if v.timer > 3 then
				ENTITIES.remove(k)
			end
		end
	end
end

function LEVEL_3.draw()
	ENTITIES.draw()
	MISC.print("In Limbo, it's full of traps")
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

function LEVEL_3.goal()
	local p = ENTITIES.getEntity("PLAYER")
	return p.x > settings.gameWidth - 8
end

GAMESTATES.insertLevel(LEVEL_3)


return LEVEL_3
