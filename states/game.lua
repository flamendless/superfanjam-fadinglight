local STATECLASS = require("modules/gamestatesClass")

local GAME = STATECLASS:set("GAME")
local entities = {}

function GAME.preload()
	PRELOADER.newImage(assets.images,"playerSheet","assets/images/entities/player_sheet.png")

	ASSETS.preload(function()
		local _player = ANIM8.newGrid(10,18,assets.images.playerSheet:getDimensions())
		
		local pIdleMax = 2
		local pRunMin = pIdleMax + 1
		local pRunMax = 6
		local pIdleSpeed = 0.5
		local pRunSpeed = 0.1
		local pJumpMin = pRunMax + 1
		local pJumpMax = 9
		local pJumpSpeed = 0.08

		anim_pIdle = ANIM8.newAnimation(_player('1-' .. pIdleMax,1),pIdleSpeed)
		anim_pRun = ANIM8.newAnimation(_player(pRunMin .. '-' .. pRunMax,1),pRunSpeed)
		anim_pJump = ANIM8.newAnimation(_player(pJumpMin .. '-' .. pJumpMax,1),pJumpSpeed)
	end)
end

function GAME.load()
	player = PLAYER(anim_pIdle,MISC.centerWidth(),MISC.centerHeight(),20)
end

function GAME.update(dt)
	for k,v in pairs(entities) do
		v:update(dt)
	end
end

function GAME.draw()
	for k,v in pairs(entities) do
		v:draw()
	end
end

function GAME.keypressed(key)
	for k,v in pairs(entities) do
		v:keypressed(key)
	end
end

function GAME.keyreleased(key)
	for k,v in pairs(entities) do
		v:keyreleased(key)
	end
end

function GAME.insertEntities(obj)
	table.insert(entities,obj)
end

function GAME.exit()

end

return GAME
