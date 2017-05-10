local STATECLASS = require("modules/gamestatesClass")

local GAME_INTRO = STATECLASS:set("GAME")

function GAME_INTRO.preload()
	PRELOADER.newImage(assets.images,"playerSheet","assets/images/entities/player_sheet.png")

	ASSETS.preload(function()
		local _player = ANIM8.newGrid(10,18,assets.images.playerSheet:getDimensions())
		
		local pIdleMax = 2
		local pRunMin = pIdleMax + 1
		local pRunMax = 6
		local pIdleSpeed = 0.5
		local pRunSpeed = 0.1
		local pJumpMin = pRunMax + 1
		local pJumpMax = 10
		local pJumpSpeed = 0.08
		local pFallMin = pJumpMax + 1
		local pFallMax = 13
		local pFallSpeed = 0.1


		anim_pIdle = ANIM8.newAnimation(_player('1-' .. pIdleMax,1),pIdleSpeed)
		anim_pRun = ANIM8.newAnimation(_player(pRunMin .. '-' .. pRunMax,1),pRunSpeed)
		anim_pJump = ANIM8.newAnimation(_player(pJumpMin .. '-' .. pJumpMax,1),pJumpSpeed)
		anim_pFalling = ANIM8.newAnimation(_player(pFallMin .. '-' .. pFallMax,1),pFallSpeed)
	end)
end

function GAME_INTRO.load()
	player = PLAYER(anim_pIdle,16,(100 - assets.images.playerSheet:getHeight()),20)
	ground = GROUND(0,100,settings.gameWidth,settings.gameHeight)
end

function GAME_INTRO.update(dt)
	for k,v in pairs(ENTITIES.get()) do
		v:update(dt)
	end
end

function GAME_INTRO.draw()
	for k,v in pairs(ENTITIES.get()) do
		v:draw()
	end
end

function GAME_INTRO.keypressed(key)
	for k,v in pairs(ENTITIES.get()) do
		v:keypressed(key)
	end
end

function GAME_INTRO.keyreleased(key)
	for k,v in pairs(ENTITIES.get()) do
		v:keyreleased(key)
	end
end

function GAME_INTRO.exit()

end

return GAME_INTRO
